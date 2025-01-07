# AWS Lambda Deployment with Terraform and GitHub Actions

This project is designed to deploy multiple AWS Lambda functions using Terraform. The Lambda functions are stored in an S3 bucket and are deployed through GitHub Actions.

## Project Structure

The repository is organized into several key directories:

- **.github/workflows**: Contains the GitHub Actions workflow file (`deploy.yml`) that automates the deployment process.
- **environments**: Includes environment-specific configurations. Each environment (e.g., dev, prod, staging) has its own directory with Terraform configuration files and variable files (`lambda_all.tfvars`).
- **modules/lambdas**: Contains the reusable Terraform modules for deploying Lambda functions. This includes the Lambda-specific configurations (`lambda.tf`, `lambda_vars.tf`).
- **main.tf**: This is the main terraform file to configure the modules.
- **variables.tf**: This is the variables file for the main terraform file.

## Key Components

- **Terraform**: Used to define and provision the infrastructure for the Lambda functions. The configuration files specify the resources needed, such as Lambda functions, IAM roles, and S3 buckets.
- **GitHub Actions**: Automates the deployment process. Whenever changes are pushed to the `main` branch, the workflow defined in `.github/workflows/deploy.yml` triggers and deploys the Lambda functions to AWS.
- **S3 Bucket**: Stores the Lambda function code as zip file, which is referenced by the Terraform configuration during deployment.

## Workflow

1. **Environment Configuration**: Each environment (dev, prod, staging) has its own set of Terraform configuration files and variable files. This allows for environment-specific settings and resources.
2. **Terraform Modules**: The `modules/lambdas` directory contains reusable modules for deploying Lambda functions. These modules are referenced in the environment-specific configuration files.
3. **GitHub Actions**: The workflow file (`deploy.yml`) in the `.github/workflows` directory automates the deployment process. It uses the AWS credentials stored as GitHub Secrets to authenticate and deploy the Lambda functions.

## Summary

This project provides a structured and automated approach to deploying AWS Lambda functions using Terraform and GitHub Actions. By organizing the repository into environments and modules, it ensures a scalable and maintainable infrastructure setup.
