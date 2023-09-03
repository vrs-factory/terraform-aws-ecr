variable "namespace" {
  type        = string
  description = "Will be used as repository `$namespace` in `$namespace/$name`."
}

variable "name" {
  type        = string
  description = "Will be used as repository `$name` in `$namespace/$name`."
}

variable "max_images_count" {
  type        = number
  default     = 50
  description = "How many Docker Image versions AWS ECR will store."
}

variable "rc_images_prefix" {
  type        = string
  default     = "rc"
  description = "Docker image prefix for RC."
}

variable "release_images_prefix" {
  type        = string
  default     = "v"
  description = "Docker image prefix for release version."
}

variable "protected_images" {
  type        = list(string)
  default     = ["latest"]
  description = "Protected tags (e.g. latest). Only newest will be kept."
}
