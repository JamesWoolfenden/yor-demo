module "codepipeline" {
  source  = "JamesWoolfenden/codepipeline/aws"
  version = "0.4.1"
  common_tags = {
    pike      = "permissions"
  }
  artifact_store = local.artifact_store
  description    = var.description
  name           = var.name
  stages         = var.stages
}