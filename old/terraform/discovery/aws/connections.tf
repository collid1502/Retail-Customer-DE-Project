# # each variable below, does not need specifying actual value, 
# as a corresponding TF_VAR_ value exists
# # within .bashrc, so terraform can pick it up through this method automatically 
variable "AWS_ACCESS_KEY_ID" {
  type = string 
}
variable "AWS_SECRET_ACCESS_KEY" {
  type = string
}
variable "AWS_DEFAULT_REGION" {
    type = string
}
variable "PUBLIC_IP" {
    type = string
}

# Define the AWS provider and region
provider "aws" {
    access_key = var.AWS_ACCESS_KEY_ID
    secret_key = var.AWS_SECRET_ACCESS_KEY
    region = var.AWS_DEFAULT_REGION
}