# GCP_Infra_Project
## Project description
### Name:
Securing a Golang Application Against DDoS Attacks Using Google Cloud Armor and Automated Deployments with Terraform
### Description: 
Create a system that protects a Golang application from DDoS attacks and other threats using Google Cloud Armor. The deployment of the application and infrastructure is fully automated with Terraform.  
### Used GCP Services:
- **Google Cloud Armor**: Protection against DDoS attacks and defining access rules.
- **Cloud Load Balancer**: Traffic distribution and integration with Cloud Armor. 7th layer type load balancer - http(s).
- **Compute Engine / Cloud Run**: Hosting the application.
- **Terraform**: Automating infrastructure and application deployment.
### Functionalities:
- Use **Terraform** to configure a Load Balancer with Google Cloud Armor.
- **Golang** application development.
- **Security**:
    + Cloud Armor rules: Define IPs that can access the application.
    + Logging and monitoring: Integrate with Cloud Logging to monitor unauthorized access attempts.
- **CI/CD**:
    + Terraform pipeline for infrastructure deployment: `terraform init`, `plan`, `apply` in CI/CD (e.g., GitHub Actions, GitLab CI).
    + Pipeline for building a Docker image of the application and deploying it to Cloud Run.
---

## Repo structure description
Good practice is to store code and configs separately, but in this case, "monorepo" is also appropriate choice. Project is
not big and focuses mainly on infrastructure side and GCP services.






##  Other Project Ideas
1. Automatic Application Scaling Based on Traffic
- Description: Create a system for automatic application scaling based on user traffic metrics and server load. The project focuses on efficient resource management.  
- GCP Services:
  - Compute Engine: Virtual machines to run the application.
  - Cloud Monitoring: Collecting metrics, e.g., CPU, RAM, network traffic.
  - Cloud Pub/Sub: Sending notifications when scaling thresholds are exceeded.
- Functionalities:
  - Use Terraform to create a managed group with autoscaling.
  - Golang service for analyzing metrics and triggering appropriate actions (e.g., scaling up/down).
  - Automated deployment of new instances.

2. Secure Backup and Restoration System
- Description: Create a system for regularly backing up key resources, with the option for rapid recovery in case of failure.  
- GCP Services:
  - Cloud Storage: Storing backups.
  - Cloud KMS: Encrypting backups.
  - Cloud Scheduler: Scheduling backup tasks.
- Functionalities:
  - Use Terraform to configure resources (e.g., Cloud Storage, Cloud KMS).
  - Golang application for managing backups (creation, encryption, restoration).
  - Automatic deletion of old backups after a specified time.

3. Detection and Blocking of Unauthorized Network Connections
- Description: Build a system to monitor network traffic and block unauthorized connections in real time.  
- GCP Services:
  - VPC Flow Logs: Monitoring traffic in VPC networks.
  - Cloud Functions: Automating responses to events.
  - Cloud Firewall: Managing network rules.
- Functionalities:
  - Use Terraform to configure VPC and firewall rules.
  - Golang application for analyzing flow logs and identifying suspicious traffic.
  - Automatic addition of firewall rules to block suspicious IP addresses.

4. Real-Time Monitoring and Alerting System
- Description: Create a system for real-time monitoring of events in applications and infrastructure. Use Pub/Sub for event transmission and Cloud Functions for generating alerts.  
- GCP Services:
  - Pub/Sub: Message transport.
  - Cloud Logging: Event generation.
  - Cloud Functions: Automating responses to events.
- Functionalities:
  - Use Terraform to create Pub/Sub infrastructure and configure subscriptions.
  - Golang application to generate events and send them to Pub/Sub.
  - Real-time alert handling, e.g., via email, Slack, or SMS.

5. Distributed Queue System in Golang Using Google Cloud Pub/Sub and Securing Communication with VPC
- Description: A distributed queue system ensures reliable and scalable message processing between applications or microservices. Using Google Cloud Pub/Sub provides easy message queuing, while integration with VPC Service Controls secures communication by restricting access to authorized networks.  
- GCP Services:
  - Pub/Sub: Message queuing between applications.
  - VPC Service Controls: Restricting access to Pub/Sub from trusted networks.
  - Cloud Monitoring: Monitoring queue system load.
- Functionalities:
  - Use Terraform to set up Pub/Sub topics and subscriptions. Configure VPC Service Controls to restrict Pub/Sub access. IAM to authorize specific services or user accounts.
  - Golang:
    - Publisher: Application generating messages and publishing them to a Pub/Sub topic.
    - Subscriber: Application consuming messages from a subscription.
  - Security:
    - VPC Service Controls block access from outside the designated network.
    - IAM controls which services can publish and consume messages.

Additional Idea:  
Something related to GKE?
https://devopscube.com/devops-projects/
