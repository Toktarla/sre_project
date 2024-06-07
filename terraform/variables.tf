variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "key_name" {
  description = "SSH key name"
}

variable "ami" {
  description = "AMI ID for EC2 instances"
}
