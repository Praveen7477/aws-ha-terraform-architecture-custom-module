project_name = "Praveen-terraform"
vpc_cidr            = "10.0.0.0/16"
region = "us-east-1"


pub_sub_1a_cidr     = "10.0.101.0/24"
pub_sub_2b_cidr     = "10.0.102.0/24"
pri_sub_3a_cidr     = "10.0.1.0/24"
pri_sub_4b_cidr     = "10.0.2.0/24"
pri_sub_5a_cidr     = "10.0.3.0/24"
pri_sub_6b_cidr     = "10.0.4.0/24"

db_username         = "adminuser"
db_password         = "StrongPassword123!"   # ⚠️ Do NOT push real passwords to GitHub

certificate_domain_name = "example.com"
additional_domain_name  = "www.example.com"
