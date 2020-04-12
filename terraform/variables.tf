variable name {
  description = "Environment name"
  type        = string
}

variable zone {
  description = "Region"
  type        = string
}

variable worker_machine_type {
  description = "Worker node's machine type"
  type        = string
  default     = "n1-standard-2"
}

variable worker_disk_size {
  description = "Boot disk size (GB) for worker nodes"
  type        = number
  default     = 20
}

variable node_pool_autoscaling_min_node_count {
  description = "Minimum nodes in cluster = value * availability zones count"
  type        = number
  default     = 1
}

variable node_pool_autoscaling_max_node_count {
  description = "Maximum nodes in cluster = value * availability zones count"
  type        = number
  default     = 1
}

variable project_id {
  description = "Project ID in GCP"
  type        = string
}

variable "gce_ssh_user" {
  type        = string
  description = "Username for ssh key"
}

variable "gce_ssh_pub_key_file" {
  type        = string
  description = "Path to ssh pub key"
}