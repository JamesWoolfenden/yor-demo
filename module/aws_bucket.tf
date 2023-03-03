resource "aws_s3_bucket" "pike" {
    tags = var.tags
}

variable "tags" {
    type = map
    description = "(optional) describe your variable"
}