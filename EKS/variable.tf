variable "ami" {
  description = "OS AMI ID"
  type        = string
  default     = "ami-02eb0c2388ee999f9"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.medium"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
  default     = "Priya-k8s"
}