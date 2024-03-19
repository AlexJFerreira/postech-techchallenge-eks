variable "environment" {
    description = "Environment name"
    default     = "production"
}

variable "vpc_cidr" {
    description = "Cidr value of vpc"
    default = "10.0.0.0/16"
}

variable "vpc_name" {
    description = "Name of vpc"
    default     = "eks-vpc"
}   

variable "cluster_name" {
    description = "Name of cluster"
    default     = "eks-cluster"
}

variable "public_subnets_cidr" {
    description = "List of public subnet cidr"
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "availability_zones_public" {
    description = "List of availability zones of public subnets"
    default     = ["us-east-1a", "us-east-1b"]
}

variable "private_subnets_cidr" {
    description = "List of private subnets cidr"
    default     = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}

variable "availability_zones_private" {
    description = "List of availability zones of private subnets"
    default     = ["us-east-1a", "us-east-1b"]
}

variable "cidr_block-nat_gw" {
    description = "Destination cidr of nat gateway"
    default    = "0.0.0.0/0"
}

variable "cidr_block-internet_gw" {
    description = "Destination cidr of internet gateway"
    default     = "0.0.0.0/0"
}