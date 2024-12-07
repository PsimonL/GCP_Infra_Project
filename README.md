# GCP_Infra_Project
## Project Description
### Name:
Securing a Golang Application Against DoS/DDoS Attacks Using Google Cloud Armor and Automated Deployments with Terraform.

### Description:
The project automates the deployment of a Golang application and its infrastructure to Google Cloud Platform (GCP). The codebase, including the application source code and Terraform infrastructure configuration, is stored in GitHub. Deployment is triggered automatically upon changes to the repository, ensuring consistent and secure provisioning of the environment and application.

### Used GCP Services:
- **Google Cloud Armor**: Protection against DoS/DDoS attacks and defining access rules.
- **Cloud Load Balancer**: Traffic distribution and integration with Cloud Armor. 7th layer type load balancer (HTTP(S)).
- **Cloud Run**: Hosting the Golang application with serverless autoscaling.
- **Compute Engine**: Small virtual machines provisioned for testing DoS/DDoS scenarios.
- **Cloud Logging / Monitoring**: Providing visibility into app performance, security events, and detecting DoS/DDoS attempts.
- **Notification Channels / Cloud Functions**: Configured to send real-time, security alerts via email, SMS, webhooks, etc.

### Functionalities:
- **Golang Microservice**:
  + A lightweight Golang-based service designed for high performance.
- **Security**:
  + Cloud Load Balancer integrated with Google Cloud Armor for traffic control.
  + Cloud Armor rules:
    - Define IPs that can access the application.
    - Implement rate-limiting policies to mitigate DoS attacks.
- **CI/CD**:
  + **GitHub Actions pipeline** automates deployment:
    - Builds a Docker image of the application.
    - Deploys it to Cloud Run.
    - Provisions infrastructure (including Load Balancer and Cloud Armor) using Terraform.
- **Infrastructure as Code (IaC)**:
  + Terraform used for consistent and automated provisioning:
    - Cloud Run for the application.
    - Load Balancer and Cloud Armor rules for security.
    - Small Compute Engine instances for testing attacks.
  + Commands like `terraform init`, `terraform plan`, and `terraform apply` are executed automatically as part of the CI/CD pipeline.
- **Logging and Monitoring**:
  + Integrates with Cloud Logging to track unauthorized access attempts and abnormal request patterns.
- **Alerts**:
  + Notification Channels or Cloud Functions send alerts for suspicious activity, such as repeated requests from a single IP.
---

## Repo structure description
Good practice is to store code and configs separately, but in this case, "monorepo" is also appropriate choice. Project is
not big and focuses mainly on infrastructure side and GCP services.
---

## C4 model: C2 diagram - container diagram
- The C4 Model is a simple yet powerful approach for visualizing software architecture, focusing on four hierarchical levels: Context, Containers, Components, and Code. It helps communicate the structure and interactions of a system in a clear and structured way, suitable for both technical and non-technical audiences. More information can be found here: https://c4model.com/.
- Container diagram (C2 diagram) for this project:
![C2_diagram_for_this_project](images_n_resources/GCP_Infra_Project_Diagram.png)
---

## Sample Snyk scan 
- Unfortunately free versions of GitHub and Snyk only offer scanning and results at https://app.snyk.io/ Snyk web console.
But sample CI/CD config was provided to run SAST type scanning and visualize results at ```GCP_Infra_Project > Security > Code scanning alerts```.
- Sample scan from Snyk web console:
![SampleSnykScan.png](images_n_resources/SampleSnykScan.png)
- Because of already merging and pulling current project to Snyk Web Console, automatic test will be run. And can be found at Web Console.
Follow **(Details)** link which can be seen at below screenshot:
![SnykPR_sample.png](images_n_resources/SnykPR_sample.png)
- Sample scan report integrated with Github, based on provided [documentation](https://github.com/snyk/actions/tree/master/golang):
![sarif-example.png](https://raw.githubusercontent.com/snyk/actions/refs/heads/master/_templates/sarif-example.png)
---


## Useful stuff and links:
- Automate Terraform with GitHub Actions: https://developer.hashicorp.com/terraform/tutorials/automation/github-actions
---