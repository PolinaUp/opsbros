
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


resource "aws_s3_bucket_object" "object_html" {

  content_type = "text/html"

  # for_each = fileset(path.module, "deployment/**/*")
  bucket = "s3-opsbros-text.hashicorp.com"
  key    = replace(each.value, "deployment", "")
  # source   = each.value
  for_each = fileset(path.module, "deployment/*")
  source   = each.value
  # key      = each.value


}
resource "aws_s3_bucket_object" "object_css" {

  content_type = "text/css"

  # for_each = fileset(path.module, "deployment/**/*")
  bucket = "s3-opsbros-text.hashicorp.com"
  key    = replace(each.value, "deployment", "")
  # source   = each.value
  for_each = fileset(path.module, "deployment/style/*")
  source   = each.value
  # key      = each.value


}

resource "aws_s3_bucket_object" "object_svg" {

  content_type = "image/svg+xml"

  # for_each = fileset(path.module, "deployment/**/*")
  bucket = "s3-opsbros-text.hashicorp.com"
  key    = replace(each.value, "deployment", "")
  # source   = each.value
  for_each = fileset(path.module, "deployment/media/**/*")
  source   = each.value
  # key      = each.value


}
resource "aws_s3_bucket_object" "object_ttf" {

  content_type = "font/ttf"

  # for_each = fileset(path.module, "deployment/**/*")
  bucket = "s3-opsbros-text.hashicorp.com"
  key    = replace(each.value, "deployment", "")
  # source   = each.value
  for_each = fileset(path.module, "deployment/fonts/*")
  source   = each.value
  # key      = each.value


}

resource "aws_s3_bucket_object" "object_js" {

  content_type = "text/javascript"

  # for_each = fileset(path.module, "deployment/**/*")
  bucket = "s3-opsbros-text.hashicorp.com"
  key    = replace(each.value, "deployment", "")
  # source   = each.value
  for_each = fileset(path.module, "deployment/scripts/*")
  source   = each.value
  # key      = each.value


}
