provider "google" {
  credentials = "${file("~/.config/gce/tf-test-08a0c30d4dad.json")}"

  project = "tf-test-152120"
  region  = "us-west1-a"
}
