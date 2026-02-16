# Highly Available Multi-Tier AWS Architecture Built with Custom Terraform Modules

## 📌 Project Overview

This project demonstrates a production-style, highly available **3-tier AWS architecture** built entirely using **custom Terraform modules**.

The infrastructure follows Infrastructure as Code (IaC) best practices and is fully modular, reusable, and environment-ready.

All AWS resources were provisioned using **self-designed Terraform modules** — no Terraform Registry modules were used.

---

## 🏗 Architecture Overview

This solution implements a scalable and highly available cloud architecture across multiple Availability Zones.

### Architecture Layers

### 1️⃣ Presentation Layer
- Amazon Route53 (DNS)
- Amazon CloudFront (CDN)

### 2️⃣ Application Layer
- Application Load Balancer (ALB)
- EC2 Auto Scaling Group
- Launch Template with User Data

### 3️⃣ Database Layer
- Amazon RDS (Multi-AZ: Primary + Standby)

### 4️⃣ Networking Layer
- Custom VPC
- Public Subnets
- Private Web Subnets
- Private DB Subnets
- NAT Gateways
- Security Groups

---

## 🖼 Architecture Diagram

<img width="1024" height="1024" alt="ChatGPT Image Feb 16, 2026, 11_12_26 PM" src="https://github.com/user-attachments/assets/540c4bde-f379-4883-a5c0-5986d5dfe4e6" />

```

---

## 🧩 Custom Terraform Module Design

All infrastructure components were abstracted into reusable modules:

```
modules/
│
├── vpc/
├── nat/
├── sg/
├── alb/
├── asg/
├── rds/
├── cloudfront/
├── route53/
└── key/
```

Each module follows a clean and consistent structure:

```
main.tf
variables.tf
outputs.tf
```

### Why Custom Modules?

- Reusability
- Clean separation of concerns
- Scalable design
- Production-style organization
- Easier maintenance
- Environment portability

---

## 📂 Project Structure

```
demo/
│
├── modules/
│
└── root/
    ├── main.tf
    ├── provider.tf
    ├── backend.tf
    ├── variables.tf
    └── terraform.tfvars
```

The `root` directory orchestrates all modules and manages:

- Provider configuration
- Remote backend
- Module wiring
- Variable injection

---

## ⚙️ Key Features

- Multi-AZ High Availability
- Auto Scaling Compute Layer
- Global Content Delivery via CloudFront
- Secure Networking (Private Subnets + NAT)
- RDS Multi-AZ Deployment
- Fully Modular Terraform Codebase
- Infrastructure as Code (IaC)
- Reproducible & Scalable Deployment

---

## 🚀 Deployment Instructions

### 1️⃣ Clone the repository

```bash
git clone https://github.com/yourusername/aws-multi-tier-architecture-terraform.git
cd aws-multi-tier-architecture-terraform/root
```

### 2️⃣ Initialize Terraform

```bash
terraform init
```

### 3️⃣ Review Execution Plan

```bash
terraform plan
```

### 4️⃣ Apply Infrastructure

```bash
terraform apply
```

---

## 🔐 Requirements

- Terraform >= 1.x
- AWS CLI configured
- Valid AWS IAM permissions
- Domain name (for Route53 & CloudFront)
- ACM Certificate (must be in us-east-1 for CloudFront)

---

## 📈 What This Project Demonstrates

- Advanced Terraform module structuring
- AWS high availability architecture patterns
- Cloud-native infrastructure design
- Dependency management between modules
- Real-world Infrastructure as Code implementation

---

## 🎯 Learning Outcomes

Through this project, I strengthened my understanding of:

- Terraform module composition
- AWS networking architecture
- Auto Scaling mechanisms
- CloudFront + ACM integration
- Multi-AZ database deployment
- Production-ready IaC practices

---

## Thanks for reading :)
