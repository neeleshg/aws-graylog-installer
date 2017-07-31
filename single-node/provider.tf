provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "./creds"
  profile		  = "default"
}
