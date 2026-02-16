# AWS Asset Delivery Infrastructure

Secure AWS infrastructure for asset delivery using Terraform, CloudFront, and S3 with Origin Access Control (OAC).

## Architecture

- **S3 Bucket**: Private bucket for storing assets
- **CloudFront Distribution**: CDN for fast content delivery
- **Origin Access Control (OAC)**: Ensures S3 bucket is not publicly accessible
- **CloudWatch Alarm**: Monitors 5xx error rate spikes

## Requirements

- AWS Account
- Terraform >= 1.7.0
- AWS CLI configured with appropriate credentials

## Deployment

### Local Deployment
```bash
cd terraform
terraform init
terraform plan
terraform apply
```

### GitHub Actions Deployment

Push to `main` branch triggers automatic deployment:
```bash
git push origin main
```

## Infrastructure Components

### Security Features
- Private S3 bucket with public access blocked
- CloudFront OAC for secure S3 access
- HTTPS-only access (HTTP redirects to HTTPS)

### Monitoring
- CloudWatch Alarm for 5xx error rate > 5%
- Alarm triggers after 2 consecutive evaluation periods (10 minutes)

## Testing

Test file URL: https://dbs3soeokkixz.cloudfront.net/test.txt

## Project Structure
```
.
├── terraform/
│   ├── main.tf          # Main infrastructure resources
│   ├── variables.tf     # Input variables
│   ├── outputs.tf       # Output values
│   └── provider.tf      # AWS provider configuration
├── .github/
│   └── workflows/
│       └── deploy.yml   # GitHub Actions workflow
├── test.txt             # Test file for delivery
└── README.md            # This file
```

## Outputs

After deployment, Terraform provides:
- CloudFront distribution URL
- S3 bucket name
- CloudWatch alarm name

## Clean Up

To destroy all resources:
```bash
cd terraform
terraform destroy
```

## Author

Iana Rodyakina