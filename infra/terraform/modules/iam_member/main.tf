resource "google_cloud_run_service_iam_member" "all_users" {
  service  = var.cloud_run_service_name
  location = var.region
  role     = "roles/run.invoker"
  member   = "allUsers"
}