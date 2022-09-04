provider "aws" {
  region = "eu-west-1"
}

module "user_pool" {
  source = "../../"

  name = "test-groups"
  groups = {
    Admin = {
      description = "Users who have administrator access"
      precedence  = 1
      # role_arn = ""
    }
    Worker = {
      description = "Users who have worker access"
      precedence  = 2
    }
  }
}
