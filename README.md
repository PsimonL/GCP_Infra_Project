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
- **Cloud Logging / Monitoring**: Providing visibility into app performance, security events and log unauthorized ora authorized access attempts.
- **Notification Channels / Cloud Functions**: Can be configured to send alerts via email, SMS, webhooks etc.
### Functionalities:
- **Golang** microservice development.
- **Security**:
    + Load Balancer: 
    + Cloud Armor rules: Define IPs that can access the application.
- **CI/CD**:
    + GitHub Actions pipeline for building a Docker image of the application and deploying it to Cloud Run / GCE.
- **IaC**:
    + Terraform as IaC tool for infrastructure configuration and deployment: `terraform init`, `plan`, `apply`.
- **Logging and monitoring**: 
    + Integrate with Cloud Logging to monitor unauthorized access attempts.
- **Alerts**:
    + Using Notification Channels or Cloud Functions to notify about alert.
---

## Repo structure description
Good practice is to store code and configs separately, but in this case, "monorepo" is also appropriate choice. Project is
not big and focuses mainly on infrastructure side and GCP services.


## C4 model: C2 diagram - container diagram
- The C4 Model is a simple yet powerful approach for visualizing software architecture, focusing on four hierarchical levels: Context, Containers, Components, and Code. It helps communicate the structure and interactions of a system in a clear and structured way, suitable for both technical and non-technical audiences. More information can be found here: https://c4model.com/.
- Container diagram (C2 diagram) for this project:  

![C2_diagram_for_this_project](images_n_resources/GCP_Infra_Project_Diagram.png)


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



## Useful stuff and links:
- Automate Terraform with GitHub Actions: https://developer.hashicorp.com/terraform/tutorials/automation/github-actions