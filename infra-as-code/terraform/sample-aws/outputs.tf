output "vpc_id" {
  value = module.network.vpc_id
}

output "private_subnets" {
  value = module.network.private_subnets
}

output "public_subnets" {
  value = module.network.public_subnets
}


output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "kubectl_config" {
  value = <<-EOT
    apiVersion: v1
    clusters:
    - cluster:
        server: ${data.aws_eks_cluster.cluster.endpoint}
        certificate-authority-data: ${data.aws_eks_cluster.cluster.certificate_authority[0].data}
      name: ${module.eks.cluster_name}
    contexts:
    - context:
        cluster: ${module.eks.cluster_name}
        user: ${module.eks.cluster_name}
      name: ${module.eks.cluster_name}
    current-context: ${module.eks.cluster_name}
    kind: Config
    preferences: {}
    users:
    - name: ${module.eks.cluster_name}
      user:
        token: ${data.aws_eks_cluster_auth.cluster.token}
  EOT
}



output "es_master_volume_ids" {
  value = "${module.es-master.volume_ids}"
}

output "es_data_volume_ids" {
  value = "${module.es-data-v1.volume_ids}"
}

output "db_instance_endpoint" {
  value = module.db.db_instance_endpoint
}


output "db_instance_name" {
  description = "The database name"
  value       = module.db.db_instance_name
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = module.db.db_instance_username
  sensitive   = true
}

output "db_instance_port" {
  description = "The database port"
  value       = module.db.db_instance_port
}

output "zone" {
  value = var.availability_zones
}

output "worker_security_group_id" {
  description = "The security group id of worker nodes"
  value       = module.eks.cluster_security_group_id
}