AWS ELB
============
This module create AWS ELBs for DC/OS

EXAMPLE
-------

```hcl
module "dcos-elbs" {
  source  = "terraform-dcos/elb/aws"
  version = "~> 0.1"

  cluster_name = "production"

  subnet_ids = ["subnet-12345678"]
  security_groups_external_masters = ["sg-12345678"]
  security_groups_external_public_agents = ["sg-12345678"]
  master_instances = ["i-00123456789e960f8"]
  public_agent_instances = ["i-00123456789e960f8"]

  aws_external_masters_acm_cert_arn = "arn:aws:acm:us-east-1:123456789123:certificate/ooc4NeiF-1234-5678-9abc-vei5Eeniipo4"
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| additional_listener | Specify a list of listeners. That are set in addition to the default listeners. | string | `<list>` | no |
| cluster_name | Specify the cluster name all resources get named and tagged with | string | - | yes |
| connection_draining | Enable connection draining | string | `false` | no |
| cross_zone_load_balancing | Enable cross-zone load balancing | string | `true` | no |
| elb_name_format | Specify a printf style format for naming the ELB. It get stripped down to 32 characters. (input cluster_name) | string | `%s-load-balancer` | no |
| health_check | Specify a health check the ELB should use | map | `<map>` | no |
| https_acm_cert_arn | Specify an ACM certifacte to be used for the external masters load balancer | string | `` | no |
| idle_timeout | The time in seconds that the connection is allowed to be idle. | string | `60` | no |
| instances | List of instance IDs | list | - | yes |
| internal | This ELB is internal only | string | `false` | no |
| listener | Specify a list of listeners. By default HTTP and HTTPS are set. If set it overwrites the default listeners. | string | `<list>` | no |
| security_groups | Security Group IDs to use | list | `<list>` | no |
| subnet_ids | Subnets to spawn the instances in. The module tries to distribute the instances | list | - | yes |
| tags | Add special tags to the resources created by this module | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| dns_name | DNS Name of the master load balancer |

