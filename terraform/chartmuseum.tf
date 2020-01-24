resource "google_storage_bucket" "chartmuseum" {
  name     = "mk-infra-chartmuseum"
  force_destroy = true
}