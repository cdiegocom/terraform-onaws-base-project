terraform {
    backend "s3" {
        key = "terraform/tfstate.tfstate"
        bucket = "xxxxxx"
        region = "us-east-1"
        access_key = "xxxx"
        secret_key = "xxx"
    }
}
