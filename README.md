# Terraform DevOps Infrastructure

This project sets up AWS infrastructure for Terraform state management using S3 and DynamoDB, with GitHub Actions CI/CD pipeline integration using OIDC authentication.

## 📁 Project Structure

```
.
├── README.md                 # Project documentation
├── .github/
│   └── workflows/
│       └── terraform.yml     # GitHub Actions CI/CD pipeline
├── backend.tf               # Terraform backend configuration
├── terraform_state.tf       # Provider and Terraform settings
└── .gitignore              # Git ignore rules
```

## 🚀 Getting Started

### Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform >= 1.0 installed
- GitHub repository with Actions enabled
- MFA-enabled AWS IAM user

**Initialize and apply Terraform**:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## 🔄 CI/CD Pipeline

### Workflow Jobs

1. **terraform-check**: Validates Terraform formatting
2. **terraform-plan**: Creates and reviews execution plan
3. **terraform-apply**: Applies changes (main branch only)

### Workflow Triggers
- **Pull Requests**: Runs format check and plan
- **Push to main**: Runs full pipeline including apply
