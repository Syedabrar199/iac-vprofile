# module "eks" {
#   source  = "terraform-aws-modules/eks/aws"
#   version = "19.19.1"

#   cluster_name    = local.cluster_name
#   cluster_version = "1.27"

#   vpc_id                         = module.vpc.vpc_id
#   subnet_ids                     = module.vpc.private_subnets
#   cluster_endpoint_public_access = true

#   eks_managed_node_group_defaults = {
#     ami_type = "AL2_x86_64"

#   }

#   eks_managed_node_groups = {
#     one = {
#       name = "node-group-1"

#       instance_types = ["t3.small"]

#       min_size     = 1
#       max_size     = 3
#       desired_size = 2
#     }

#     two = {
#       name = "node-group-2"

#       instance_types = ["t3.small"]

#       min_size     = 1
#       max_size     = 2
#       desired_size = 1
#     }
#   }
# }
# ##
# abrar's gpt

# Fetch latest Ubuntu EKS-optimized AMI for K8s 1.27
data "aws_ami" "ubuntu_eks" {
  most_recent = true

  filter {
    name   = "upc-eks"
    values = ["ubuntu-eks/k8s_1.27/images/hvm-ssd/ubuntu-focal-20.04-amd64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["380561001159"] # Canonical
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.19.1"

  cluster_name    = local.cluster_name
  cluster_version = "1.27"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    ubuntu-ng-1 = {
      name = "ubuntu-ng-1"

      instance_types = ["t3.micro"]
      min_size       = 1
      max_size       = 3
      desired_size   = 2

      ami_id = data.aws_ami.ubuntu_eks.id

      launch_template = {
        name    = "ubuntu-launch-template-ng1"
        version = "$Latest"
      }
    }

    ubuntu-ng-2 = {
      name = "ubuntu-ng-2"

      instance_types = ["t3.micro"]
      min_size       = 1
      max_size       = 2
      desired_size   = 1

      ami_id = data.aws_ami.ubuntu_eks.id

      launch_template = {
        name    = "ubuntu-launch-template-ng2"
        version = "$Latest"
      }
    }
  }
}
