variable "cluster_name" {
  description = "Specify the cluster name all resources get named and tagged with"
}

variable "tags" {
  description = "Custom tags added to the resources created by this module"
  type        = "map"
  default     = {}
}

variable "subnet_ids" {
  description = "Subnets to spawn the instances in. The module tries to distribute the instances"
  type        = "list"
}

variable "security_groups" {
  description = "Security Group IDs to use"
  type        = "list"
  default     = []
}

variable "instances" {
  description = "List of instance IDs"
  type        = "list"
}

variable "https_acm_cert_arn" {
  description = "ACM certifacte to be used for the external masters load balancer"
  default     = ""
}

variable "elb_name_format" {
  description = "printf style format for naming the ELB. Gets truncated to 32 characters. (input cluster_name)"
  default     = "load-balancer-%s"
}

variable "listener" {
  description = "List of listeners. By default HTTP and HTTPS are set. If set it overrides the default listeners."
  default     = []
}

variable "additional_listener" {
  description = "Additional list of listeners"
  default     = []
}

variable "internal" {
  description = "This ELB is internal only"
  default     = false
}

variable "health_check" {
  description = "Health check the ELB should use"
  type        = "map"

  default = {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:80"
    interval            = 30
  }
}

variable "cross_zone_load_balancing" {
  description = "Enable cross-zone load balancing"
  default     = true
}

variable "idle_timeout" {
  description = "Time in seconds the connection is allowed to be idle"
  default     = 60
}

variable "connection_draining" {
  description = "Enable connection draining"
  default     = false
}
