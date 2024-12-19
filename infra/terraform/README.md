# Terraform infrastructure setup

## Structure
The driver directory is current one, so ```.```. Terraform part was divided into "Terraform modules", more about it
can be found here: https://developer.hashicorp.com/terraform/language/modules.  
- Main driver file is ```./main.tf```, which consists of linked modules.
- Folder ```scripts``` consists of useful terraform commands and gcloud commands.
- Modules:
  + ```artifact_registry``` => Sets up registry for docker image which is being deployed by pipeline from current repository.
  + ```cloud_run_service``` => Runs docker image, after pulling it from Artifact Registry.
  + ```gce``` => Attacker DoS perspective, where should be copied ```infra/dos/dos.py``` file and used.
  + ```iam_member``` => Enables any action in the GCP.
  + ```load_balancer_n_cloud_armor``` => Load Balancer is essential to setup Cloud Armor policies to moderate and limit number of requests from certain IP address.
  + ```observability_n_alerting``` => Triggered event by 403 HTTP response status code, which enables Notification Channel to send information at given e-mail address.

## How to run?
In that exact order:
1. Artifact Registry
```shell
# ########## I ########## number of resources: 1
terraform apply -target module.artifact_registry
```
2. Run ```/.github/workflows/ci-cd-pipelien-manual.yaml``` or rerun ```/.github/workflows/ci-cd-pipelien.yaml``` to deploy docker image to Artifact Registry before applying Cloud Run. It will not work otherwise.
3. Cloud Run
```shell
# ########## II ########## number of resources: 1
terraform apply -target module.cloud_run_service
```
Remember to change switch from ```All``` to ```Internal``` with checkbox ```"Allow traffic from external Application Load Balancers"```:
![Important_to_check_for_cloud_run.png](../../images_n_resources/Important_to_check_for_cloud_run.png)
4. IAM
```shell
# ########## III ########## number of resources: 1
terraform apply -target module.iam_member
```
5. Load Balancer and Cloud Armor
```shell
# ########## IV ########## number of resources: 7
terraform apply -target module.load_balancer_n_cloud_armor
```
6. GCE
```shell
# ########## V ########## number of resources: 1
terraform apply -target module.gce
```
At GCE instance run:
```shell
sudo apt-get install -y python3 python3-pip
```
7. Observability
```shell
# ########## VI ########## number of resources: 2
terraform apply -target module.observability_n_alerting
```


## Notes

https://xebia.com/blog/four-tips-to-better-structure-terraform-projects/

To diversify:
usage of Terraform Modules

https://spacelift.io/blog/terraform-files

https://developer.hashicorp.com/terraform/language/modules