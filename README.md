# Foundation - Secure Source Manager (SSM) Setup

This guide provides a detailed walkthrough for setting up a Secure Source Manager (SSM) instance and repository on Google Cloud. SSM offers secure and managed source control for your Terraform configurations and state files. This setup is designed for users new to SSM and provides step-by-step instructions.

## Features

This setup accomplishes the following:

* **Creates a Cloud Storage Bucket:**  A dedicated storage bucket will be created to store your Terraform state files. This centralizes state management and enables features like state locking and versioning.
* **Enables Required APIs:**  Necessary Google Cloud APIs, including Secure Source Manager, will be activated for your project. These APIs are essential for interacting with the SSM service.
* **Configures IAM Permissions:**  Appropriate permissions will be granted to users and service accounts, ensuring secure access and management of the SSM resources.
* **Creates a Terraform Admin Service Account:** A dedicated service account (`tfadmin`) will be created for Terraform operations, granting it the necessary permissions to manage infrastructure within your project.
* **Creates the SSM Instance:**  An SSM instance will be created in your specified region. This instance serves as the central hub for your source repositories.
* **Sets up an SSM Repository:** A repository named `foundation-ssm` will be created within the SSM instance. This repository will house your Terraform code.

## Prerequisites

Before starting, ensure you have the following:

* **Google Cloud Project:**  You need an active Google Cloud project with billing enabled. This project will host your SSM resources.
* **`gcloud` CLI:** The `gcloud` command-line interface must be installed on your local machine and authenticated to your Google Cloud account. This tool allows you to interact with Google Cloud services.

## Detailed Setup Steps

1. **Clone the Repository:**
   Clone this repository containing the setup scripts and Terraform configurations to your local machine using a `git clone` command. This will provide you with the necessary files to automate the setup process.

2. **Configure Environment Variables:**
   Open the `foundation.sh` script and update the following variables with your project-specific values:

   * `PROJECT_ID`:  The ID of your Google Cloud project (e.g., `my-gcp-project`).
   * `PROJECT_NUM`: The numeric ID of your Google Cloud project. You can find this in the Google Cloud Console project dashboard.
   * `REGION`: The Google Cloud region where you want to create your SSM instance (e.g., `us-central1`).
   * `INSTANCE_ID`: The name you want to give to your SSM instance (e.g., `my-ssm-instance`).
   * `TF_ADMIN`:  The name of the Terraform admin service account (the default is `tfadmin`, but you can change this).
   * **Important:** Also update the email addresses associated with the `instanceOwner` role assignments. These users will have administrative access to your SSM instance.

3. **Execute the Setup Script:**
   Open a terminal on your local machine, navigate to the directory containing `foundation.sh`, and run the script using the command: `bash foundation.sh`. Be sure to update permmissions so you have the ability to execute the script. 
   This script will automate the creation of the Cloud Storage bucket, enable necessary APIs, set up the service account, and create the SSM instance.

4. **Manual SSM Repository Setup:**
   The script will provide you with specific links and instructions for the following manual steps within the SSM UI:

   * **Accept Terms and Conditions:** You will be prompted to review and accept the terms and conditions for your new SSM instance. Click on the provided link and follow the on-screen instructions.
   * **Create a New Repository:** You'll use the provided link and fill in the repository details.  Name the repository `foundation-ssm` and set the default branch to `main`.
   * **Grant Repository Access:** Add the Terraform service account (`tfadmin@[PROJECT_ID].iam.gserviceaccount.com`) as a "Secure Source Manager Admin" to your newly created repository. The script will provide a direct link to the correct page within the SSM UI. This step ensures your Terraform workflows have the required permissions to interact with the repository.

5. **Initialize and Push Terraform Configuration (Optional):**
    The `foundation.sh` script also includes example commands for initializing a local Git repository, adding your existing Terraform code, and pushing it to the newly created SSM repository. You can customize these commands to fit your specific project structure and Terraform files.


## Variables Used in the Setup

* `TF_ADMIN`: Name of the Terraform admin service account.
* `PROJECT_ID`: Your Google Cloud project ID.
* `PROJECT_NUM`:  Your Google Cloud project number.
* `REGION`: The Google Cloud region where resources are created.
* `INSTANCE_ID`: The name of your SSM instance.


## Next Steps

After completing these steps, you'll have a fully functional SSM instance with a repository ready to store your Terraform state and configurations. You can now integrate this repository with your Terraform workflows to leverage SSM's security and management features.

