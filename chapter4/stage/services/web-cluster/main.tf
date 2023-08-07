provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = "staging-cluster"
  db_remote_state_bucket = "terraform-up-and-running-unique-number-122"
  db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"
}
