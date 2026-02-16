## 🧩 Custom Module Design

All infrastructure components were built using fully custom Terraform modules.

No Terraform Registry modules were used.

Each service was abstracted into reusable modules:

- VPC Module
- NAT Gateway Module
- Security Group Module
- Application Load Balancer Module
- Auto Scaling Group Module
- RDS Module
- CloudFront Module
- Route53 Module
- Key Pair Module

Each module contains:
- main.tf
- variables.tf
- outputs.tf

This approach ensures:
- Reusability
- Scalability
- Clean separation of concerns
- Production-ready structure

