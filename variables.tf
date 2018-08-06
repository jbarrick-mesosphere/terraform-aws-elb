variable "cluster_name" {
  description = "Specify the cluster name all resources get named and tagged with"
}

variable "tags" {
  description = "Add special tags to the resources created by this module"
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
  description = "Specify an ACM certifacte to be used for the external masters load balancer"
  default     = ""
}

variable "elb_name_format" {
  description = "Specify a printf style format for naming the ELB. It get stripped down to 32 characters. (input cluster_name)"
  default     = "%s-load-balancer"
}

variable "listener" {
  description = "Specify a list of listeners. By default HTTP and HTTPS are set. If set it overwrites the default listeners."
  default     = []
}

variable "additional_listener" {
  description = "Specify a list of listeners. That are set in addition to the default listeners."
  default     = []
}

variable "internal" {
  description = "This ELB is internal only"
  default     = false
}

variable "health_check" {
  description = "Specify a health check the ELB should use"
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
  description = "The time in seconds that the connection is allowed to be idle."
  default     = 60
}

variable "connection_draining" {
  description = "Enable connection draining"
  default     = false
}
