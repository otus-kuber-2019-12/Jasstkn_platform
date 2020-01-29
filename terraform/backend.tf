terraform {
  backend "gcs" {
    bucket      = "tf-state-infra"
    prefix      = "terraform/state"
    credentials = "~/account.json"
  }
}