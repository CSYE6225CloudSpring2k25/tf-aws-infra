# Resource creation using Terraform in AWS

This project provisions an AWS Virtual Private Cloud (VPC) using Terraform, creating public and private subnets along with essential networking components like an Internet Gateway and Route Tables.

## Project Structure

```
├── main.tf             # Defines the main AWS VPC and subnets
├── variables.tf        # Declares input variables
├── terraform.tfvars    # Defines variable values
├── provider.tf         # Configures AWS provider
├── outputs.tf          # Defines output values
└── README.md           # Project documentation
```

## Requirements

- Terraform
- AWS CLI configured with the appropriate credentials
- An AWS account

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

## License

This project is open-source and can be modified as needed.

---

Feel free to update this `README.md` file based on your project needs! 🚀

