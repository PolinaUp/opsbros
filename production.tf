provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "opsbros_s3" {
  acl    = "public-read"
  bucket = "s3-opsbros-text.hashicorp.com"
  policy = file("policy.json")

  website {
    index_document = "index.html"
  }

}


resource "aws_s3_bucket_object" "object" {
  for_each = fileset(path.module, "deployment/**/*")
  bucket   = "s3-opsbros-text.hashicorp.com"
  key      = replace(each.value, "deployment", "")
  source   = each.value
}
