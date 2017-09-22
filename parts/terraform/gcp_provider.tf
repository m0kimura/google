// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("~/gcplib/YourProjectKey.json")}"
  project     = "YourProjectName"
  region      = "YourRegion"
}
