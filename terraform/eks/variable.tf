variable "cluster_name" {
  description = "the name of your stack, e.g. \"demo\""
  default     = "tech-challenge-eks-cluster"
}

variable "environment" {
  description = "the name of your environment, e.g. \"prod\""
  default     = "production"
}

variable "eks_node_group_instance_types" {
  description  = "Instance type of node group"
  default      = "t3.medium"
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  default     = ["subnet-031d6f35c8f59b6fa", "subnet-0dd55a8598fb3bf70", "subnet-0cf93f45e44786633"]
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  default     = ["subnet-0368fa45414cd8a31", "subnet-05b5cbb8ffaf3f99f", "subnet-02aba0a934d905116"]
}

variable "fargate_namespace" {
  description = "Name of fargate selector namespace"
  default     = "tech-challenge-fargate-namespace"
}