module "it" {
  source = ".."

  environment = "test"
  dc_region   = "us-west1-a"
  role        = "base"

  cohort = "a"
}
