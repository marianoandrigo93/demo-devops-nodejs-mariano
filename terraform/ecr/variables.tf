variable "aws_region" {
  description = "AWS region where ECR will be created"
  type        = string
  default     = "us-east-1"
}

variable "repository_name" {
  description = "ECR repository name"
  type        = string
  default     = "demo-devops-nodejs"
}