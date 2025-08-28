provider "aws" {
  region = var.region-name
  
  default_tags {
    tags = {
      Project = "3-Tier-Architecture TIT"
      Environment = "Dev"
      Owner = "Petar Zhivkov"
    }
  }
}