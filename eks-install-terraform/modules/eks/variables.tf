variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}


variable "cluster_version" {
  type        = string
  description = "Kubernetes version"
}


variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet Ids"
}

variable "node_groups"{
    description = "EKS node group configuration"
    type = map(object({
        instance_types = list(string)
        capacity_type = string
        scaling_config = object({
            desired_size = number
            max_size = number
            min_size = number
        })

    }))
}

