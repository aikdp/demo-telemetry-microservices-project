#where are your tf modules stored?
#Ans: As a devops engineer we have a centralised repo, within in our org where we stored all the moduled like EKS, VPC, etc and we source them if in ABS project that module is required. We source that module or invoke that module using the particular line(source = "")

# module "vpc"{
#     source = "./modules/vpc"
#     #source = "git::<COPY-PASTE-GIT-Module-URL>ref?main"
# }

module "vpc" {
  source = "./modules/vpc"
  
#   vpc_cidr             = var.vpc_cidr
#   availability_zones   = var.availability_zones
#   private_subnet_cidrs = var.private_subnet_cidrs
#   public_subnet_cidrs  = var.public_subnet_cidrs
#   cluster_name         = var.cluster_name
}

module "eks" {
  source = "./modules/eks"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnet_ids
  node_groups     = var.node_groups
}