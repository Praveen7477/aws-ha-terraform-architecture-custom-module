variable "ami" {
    default = "ami-0c1fe732b5494dc14"
  
}
variable "project_name"{}

variable "cpu" {
    default = "t2.micro"
  
}

variable "key_name" {}

variable "client" {
  
}

variable "max_size" {
    default = 6
}
variable "min_size" {
    default = 2
}
variable "desired_cap" {
    default = 3
}
variable "asg_health_check_type" {
    default = "ELB"
}
variable "pri_sub_3a_id" {}
variable "pri_sub_4b_id" {}
variable "tg_arn" {}