# AWS EC2 Terraform + Ansible Template

This repository provides a **reference DevOps template** for provisioning and configuring AWS EC2 infrastructure using **Terraform** and **Ansible**.

The project demonstrates a clean separation between **infrastructure provisioning (IaC)** and **instance configuration (CaC)**, following enterprise DevOps best practices.

---

## Purpose

This repository is intended to:

- Provision AWS EC2 infrastructure using Terraform
- Configure EC2 instances using Ansible playbooks
- Demonstrate reproducible and maintainable automation
- Serve as a reusable reference template for DevOps workflows

The focus is on **clarity, reliability, and long-term maintainability**.

---

## Architecture Overview

```
Terraform
 ├── VPC / Networking
 ├── Security Groups
 └── EC2 Instance
        ↓
Ansible
 ├── Package installation
 ├── System configuration
 └── Application setup
```

Terraform is responsible for infrastructure creation, while Ansible handles configuration after provisioning.

---

## Repository Structure

```
.
├── terraform/              # Terraform configuration files
├── ansible/                # Ansible playbooks and inventory
├── scripts/                # Helper scripts (optional)
├── .gitignore
└── README.md               # Project documentation
```

---

## Prerequisites

Ensure the following tools are installed and configured:

- AWS CLI with valid IAM credentials
- Terraform 1.x
- Ansible 2.9 or later
- SSH key pair for EC2 access
- IAM permissions to create EC2 and networking resources

---

## Terraform – Provision Infrastructure

### Initialize

```bash
cd terraform
terraform init
```

### Plan

```bash
terraform plan \
  -var="aws_region=<REGION>" \
  -var="key_pair_name=<KEY_PAIR_NAME>"
```

### Apply

```bash
terraform apply \
  -var="aws_region=<REGION>" \
  -var="key_pair_name=<KEY_PAIR_NAME>" \
  -auto-approve
```

Terraform outputs the EC2 public IP address for use with Ansible.

---

## Ansible – Configure EC2

After Terraform completes:

1. Update the Ansible inventory with the EC2 public IP
2. Run the playbook

```bash
cd ansible
ansible-playbook -i hosts playbook.yml
```

Ansible connects to the EC2 instance and performs configuration tasks.

---

## CI/CD Integration (Optional)

This template can be integrated into CI/CD pipelines using GitHub Actions or other CI tools.

Suggested secrets:

| Secret Name            | Description                    |
|------------------------|--------------------------------|
| AWS_ACCESS_KEY_ID      | AWS access key                 |
| AWS_SECRET_ACCESS_KEY | AWS secret key                 |
| AWS_REGION             | AWS region                     |
| SSH_PRIVATE_KEY        | SSH key for EC2 access         |

---

## Design Decisions

- Terraform for declarative infrastructure provisioning
- Ansible for configuration management
- Clear separation of infrastructure and configuration concerns
- Emphasis on reproducibility and documentation

---

## Future Improvements

- Convert Terraform code into reusable modules
- Add AWS SSM-based access (no SSH keys)
- Add monitoring and logging
- Add automated security checks

---

## Intended Audience

This repository is suitable for:

- DevOps engineers
- Infrastructure engineers
- Cloud automation learning projects
- Interview and reference demonstrations

---

## License

This project is provided as a reusable template and can be freely adapted.
