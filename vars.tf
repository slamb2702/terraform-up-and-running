
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "region" {
  description = "The AWS region to deploy resources to"
  type        = string
  default     = "us-west-1"
}



# variable "assume_role_arn"