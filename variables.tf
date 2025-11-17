variable "hostname" {
  description = "The hostname of the TFE instance."
  type        = string
}

variable "organization_name" {
  description = "The name of the TFE organization."
  type        = string
}

variable "github_oauth_token" {
  description = "The GitHub OAuth token for TFE integration."
  type        = string
  sensitive   = true
}
