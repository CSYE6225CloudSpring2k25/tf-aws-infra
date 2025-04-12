# Resource creation using Terraform in AWS

This project provisions an AWS Virtual Private Cloud (VPC) using Terraform, creating public and private subnets along with essential networking components like an Internet Gateway and Route Tables.

## Project Structure

```
├── main.tf             # Defines the main AWS VPC and subnets
├── variables.tf        # Declares input variables
├── terraform.tfvars    # Defines variable values
├── provider.tf         # Configures AWS provider
├── outputs.tf          # Defines output values
├── packer/             # Directory containing Packer configuration files for AMI creation
└── README.md           # Project documentation
```

## Requirements

- Terraform
- AWS CLI configured with the appropriate credentials
- An AWS account
- Packer: For building custom AMIs

## Variables

The following variables are defined in `variables.tf` and configured in `terraform.tfvars`:

- **aws\_region**: AWS region where resources will be created (e.g., `us-east-1`)
- **aws\_profile**: AWS CLI profile to use (e.g., `dev`)
- **vpc\_cidr**: CIDR block for the VPC
- **project\_name**: Prefix for resource names
- **public\_subnets**: List of public subnet CIDR blocks
- **private\_subnets**: List of private subnet CIDR blocks
- **azs**: List of availability zones

## Resources Created

- **VPC** with the specified CIDR block
- **Public and Private Subnets** spread across multiple Availability Zones
- **Internet Gateway** for public subnets
- **Route Tables** for public and private subnets
- **KMS Keys**: For encryption of S3, Secrets Manager, and EC2
- **IAM Roles and Policies**: Set up for EC2, Auto Scaling, and other services
- **Secrets Manager and RDS**: For storing database credentials and hosting a database instance
- **S3 Bucket**: For storing application data or backups
- **EC2 Instances**: Launched with the custom AMI and configured via user data
- **ACM Certificate**: Imported for SSL/TLS encryption

## Usage

### 1. Initialize Terraform

Run the following command to initialize Terraform and download the necessary provider plugins:

```sh
terraform init
```

### 2. Plan Infrastructure Changes

Check what changes Terraform will make without applying them:

```sh
terraform plan -var-file="terraform.tfvars"
```

### 3. Apply Configuration

Deploy the infrastructure:

```sh
terraform apply -var-file="terraform.tfvars"
```

### 4. Build Custom AMI with Packer

Navigate to the packer/ directory and build the AMI:

```sh
cd packer
packer build -var-file=packer/variables.pkrvars.hcl 
```

### 5. Import SSL Certificate

To import the SSL certificate into ACM, use the following command:

```sh
aws acm import-certificate \
  --certificate fileb://demo_certificate.pem \
  --private-key fileb://demo_privatekey.pem \
  --certificate-chain fileb://demo_chain.pem \
  --profile demo \
  --region us-east-1
```

### 6. Destroy Resources

To delete all resources created by Terraform:

```sh
terraform destroy
```

## Outputs

After applying the configuration, Terraform will output:

- **VPC ID**
- **Public Subnet IDs**
- **Private Subnet IDs**
- **Internet Gateway ID**
- **KMS Key IDs**
- **S3 Bucket Name**
- **RDS Endpoint**
- **AMI ID** (from Packer build)

## Notes

- Ensure all AWS CLI profiles are correctly configured with appropriate permissions
- Store sensitive data like certificate files and AWS credentials securely
- Test the AMI and user data scripts in a non-production environment before deploying to production