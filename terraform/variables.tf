variable "prefix" {
  description = "Prefix for all resource names"
  type        = string
  default     = "test-app"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "ami" {
  description = "AMI ID for EC2 instance - Ubuntu24"
  type        = string
  default     = "ami-0ecb62995f68bb549"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "access-keypair" {
  description = "Name of the existing AWS EC2 key pair to use for SSH access."
  type        = string
  default     = "ec2-demo1-new"  
}
