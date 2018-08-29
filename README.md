# aws-workspace
create aws workspace by terraform

# terraform download

https://www.terraform.io/downloads.html

# image

![image](https://github.com/takahashi-toshitaka/aws-workspace/blob/master/aws-workspace.png)

# How to Use

1. setup s3 & Dynamodb. for manage Terraform state.
```
$ cd initialize
$ terraform init
$ terraform apply
```

2. setup provider.
```
$ cd main
$ cat << 'EOS' > provider_override.tf
provider "aws" {
  region = "ap-northeast-1"

  profile = "XXXXXXXX"

  assume_role {
    role_arn     = "XXXXXXXX"
    session_name = "XXXXXXXX"
  }
}

terraform {
  backend "s3" {
    region  = "ap-northeast-1"
    bucket  = "terraform-state-storage"
    key     = "terraform.tfstate"
    profile = "XXXXXXXX"

    dynamodb_table = "terraform-lock-table"
  }
}
EOS
```

3. create aws workspace.
```
$ terraform init
$ terraform apply
```
