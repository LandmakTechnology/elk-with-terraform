variable "region" {
  type    = list(string)
  default = ["us-west-1", "us-west-2", "us-east-1"]
}

variable "myInstance" {
  type = list(string)
  default = ["T2.MICRO", "T2.MEDIUM", "T3.MICRO"]
  #default = ["t2.micro", "t2.medium"]
}

variable "my_key" {
  type    = string
  default = "ansible-infra-test"
}

variable "key_path" {
  description = "Private key path"
  default     = "mykey/ansible-infra-test.pem"
}

variable "instance_user" {
  default = "ubuntu"
}

variable "map" {
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "stage" = "t2.medium"
  }
}