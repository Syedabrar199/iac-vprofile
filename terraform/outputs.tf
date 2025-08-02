# output "cluster_name" {
#   description = "Amazon Web Service EKS Cluster Name"
#   value       = module.eks.cluster_name
# }

# output "cluster_endpoint" {
#   description = "Endpoint for Amazon Web Service EKS "
#   value       = module.eks.cluster_endpoint
# }

# output "region" {
#   description = "Amazon Web Service EKS Cluster region"
#   value       = var.region
# }


# output "cluster_security_group_id" {
#   description = "Security group ID for the Amazon Web Service EKS Cluster "
#   value       = module.eks.cluster_security_group_id
# }
# Abrar's code
output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "The endpoint for the EKS Kubernetes API server"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "The base64 encoded certificate data required to communicate with the cluster"
  value       = module.eks.cluster_certificate_authority_data
}

output "eks_cluster_id" {
  description = "The EKS cluster ID"
  value       = module.eks.cluster_id
}

output "eks_oidc_provider" {
  description = "The OIDC provider URL for the EKS cluster"
  value       = module.eks.oidc_provider
}

output "node_group_ubuntu_ng1_name" {
  description = "Name of the Ubuntu node group 1"
  value       = module.eks.eks_managed_node_groups["ubuntu-ng-1"].node_group_name
}

output "node_group_ubuntu_ng2_name" {
  description = "Name of the Ubuntu node group 2"
  value       = module.eks.eks_managed_node_groups["ubuntu-ng-2"].node_group_name
}

output "worker_iam_role_arns" {
  description = "IAM roles attached to the worker node groups"
  value       = module.eks.eks_managed_node_group_iam_role_arns
}
