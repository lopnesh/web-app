provider "aws" {
  region = var.region
  default_tags {
    Owner = "ezherebnoy"
  }
}
