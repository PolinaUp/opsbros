terraform {
  backend "s3" {
    bucket = "opsbros.company"
    key    = "state"
    region = "us-east-1"
  }
}

provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}

# resource "aws_route53_record" "www" {
#   zone_id = "Z06739541CIDNKNREB3JT"
#   name    = "www.example.com"
#   type    = "A"
#   ttl     = "300"
#   records = [aws_eip.lb.public_ip]
#
# }

resource "aws_s3_bucket" "opsbros_s3" {
  acl    = "public-read"
  bucket = "opsbros.company"
  policy = file("policy.json")


  website {
    index_document = "index.html"
    # website_domain = "s3-opsbros.s3-website-us-east-1.amazonaws.com"
  }

}

resource "null_resource" "remove_and_upload_to_s3" {
  provisioner "local-exec" {
    command = "aws s3 sync ${path.module}/deployment s3://${aws_s3_bucket.opsbros_s3.id}"
  }
}

resource "aws_instance" "import" {
  instance_type          = "t2.micro"
  ami                    = "ami-0c2b8ca1dad447f8a"
  key_name               = "ec2"
  vpc_security_group_ids = [aws_security_group.import_security_group.id]
  tags = {
    env  = "staging"
    Name = "imported"
  }

}

resource "aws_security_group" "import_security_group" {
  name = "import_security_group"


}
