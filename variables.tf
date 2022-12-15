variable "region" {
  description = "stuff"
  type        = string
  default     = "af-south-1"
  validation {
    condition     = contains(["eu-west-1", "af-south-1"], var.region)
    error_message = "stuff error"
  }
}

variable "environment" {
  description = "stuff"
  type        = string
  default     = "stuff"

  validation {
    condition     = contains(["dev"], var.environment)
    error_message = "stuff error"
  }
}

variable "account" { #check
  type = string
  default = "stuff"
}

variable "health_check" {
   type = map(string)
   default = {
      "unhealthy_threshold" = "3"
      "healthy_threshold" = "3"
      "timeout"  = "6"
      "interval" = "10"
    }
}