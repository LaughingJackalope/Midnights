# Terraform Google Cloud Infrastructure

This directory contains Terraform code to deploy a VPC network, subnets, firewall rules, a NAT gateway, and Compute Engine instances on Google Cloud Platform (GCP), mirroring an existing AWS setup.

## Prerequisites

1.  **Google Cloud Project:** You need an active GCP project.
2.  **Enable APIs:** Ensure the following APIs are enabled in your GCP project:
    *   Compute Engine API
    *   Cloud Resource Manager API (usually enabled by default)
3.  **Terraform Installed:** Download and install Terraform from [terraform.io](https://www.terraform.io/downloads.html).
4.  **Google Cloud SDK (gcloud):** Install and initialize the Google Cloud SDK. Authenticate with your GCP account:
    ```bash
    gcloud auth application-default login
    ```
5.  **Permissions:** The credentials used by Terraform (via `gcloud auth application-default login` or a service account) must have sufficient permissions to create and manage the resources defined in this configuration (e.g., roles like `Compute Admin`, `Network Admin`, `Service Account User`).

## Configuration

1.  **Clone the repository** (if you haven't already).
2.  **Navigate to this directory:**
    ```bash
    cd Terraform/GCP
    ```
3.  **Update `main.tf`:**
    *   Open `main.tf`.
    *   Replace `"YOUR_GCP_PROJECT_ID"` with your actual GCP Project ID.
    *   Adjust `region` and `zone` if necessary.
4.  **(Optional) Configure Backend:**
    *   If you want to use a GCS backend for Terraform state (recommended for collaboration and production), uncomment and configure the `backend "gcs"` block in `main.tf`. You'll need to create a GCS bucket first.

## Deployment

1.  **Initialize Terraform:**
    ```bash
    terraform init
    ```
2.  **Review the plan:**
    ```bash
    terraform plan
    ```
    This will show you what resources Terraform will create.
3.  **Apply the configuration:**
    ```bash
    terraform apply
    ```
    Type `yes` when prompted to confirm.

## Outputs

After successful deployment, Terraform will output:
*   `public_instance_ip`: The public IP address of the public instance.
*   `private_instance_ip`: The private IP address of the private instance.
*   `vpc_network_name`: The name of the created VPC network.
*   `public_subnet_name`: The name of the public subnet.
*   `private_subnet_name`: The name of the private subnet.

You can also view outputs at any time with `terraform output`.

## Accessing Instances

*   **Public Instance:** You can SSH into the public instance using its public IP. GCP's OS Login or project-wide SSH keys are typically used. If using `gcloud`:
    ```bash
    gcloud compute ssh public-instance --zone YOUR_CONFIGURED_ZONE
    ```
*   **Private Instance:** The private instance does not have a public IP. You can SSH into it from the public instance:
    1.  SSH into the public instance.
    2.  From the public instance, SSH into the private instance using its private IP or instance name.

## Cleanup

To remove all resources created by this Terraform configuration:
```bash
terraform destroy
```
Type `yes` when prompted.
