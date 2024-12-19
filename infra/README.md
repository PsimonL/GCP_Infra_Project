# Infra


- Folder ```dos``` consists of Python and Bash equivalent files to perform sample DoS.
> Whether this can be considered a DoS attack depends on the rate-limiting policies set for the Cloud Run service through Cloud Armor. If strict limits are in place, this script could be perceived as abuse or an attempt to disrupt the service
> For laboratory and learning purposes, with certain and adjusted Cloud Armor policies, it can be recognized as type of DoS.

- Folder ```terraform``` consists whole infrastructure setup for GCP provider for this project.