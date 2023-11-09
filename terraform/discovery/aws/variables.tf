# By using variables for these items, the same terraform plane can be used 
# over & over again, only needing change the variable values and leaving 
# other code block as is

variable "ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) for Instance."
  type        = string
  default     = "ami-06d0baf788edae448"  # AMI ID for eu-west-2
}

variable "ami_name" {
  description = "The tag name of the Amazon Machine Image (AMI) for Instance."
  type        = string
  default     = "retailDE_ec2_instance"  # tag name for instance  
}

variable "ami_key_pair_name" {
  description = "The name of the key-pair to pick up locally and set up on instance for SSH"
  type        = string
  default     = "retail_SSH_key"  # local (uncommitted) key-pair file. 
  # Auto picks up a .pem file of this name in folder 
}
# note - if you leave variable values empty, like:
# ----->   variable "ami_id" {}
# you will be prompted at runtime to provide values via the CLI 