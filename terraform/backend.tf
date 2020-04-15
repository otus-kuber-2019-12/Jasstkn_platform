terraform {
  backend "gcs" {
    bucket      = "tf-state-infra-273919"
    prefix      = "terraform/state"
    credentials = "~/account.json"
  }
}