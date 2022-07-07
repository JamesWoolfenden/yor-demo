# yor demo

What is Yor:
yor: <https://memory-alpha.fandom.com/wiki/Yor>

> Yor is an open-source tool that helps add informative and consistent tags across infrastructure as code (IaC) frameworks. Today, Yor can automatically add tags to Terraform, CloudFormation, and Serverless Frameworks.

Github:
<https://github.com/bridgecrewio/yor>

Install:

```shell
brew tap bridgecrewio/tap
brew install bridgecrewio/tap/yor
```

```powershell
choco install yor
```

Or you can build your own:

```shell
git clone https://github.com/bridgecrewio/yor
cd yor
go build
```

## Basic usage

In the supplied repo you will see the folder Terraform. It contains my so oh so basic terraform:

```hcl
resource "aws_instance" "honeypot" {

}
```

and:

```hcl
resource "aws_s3_bucket" "name" {

}
```

So to apply Yors' basic tags:

```shell
yor tag -d terraform
  __    __
  \ \  / /
   \ \/ /___  _  ____
    \  /  _ \| |/  __|
    | |  |_| |   /
    |_|\____/|__|v0.1.148
 Yor Findings Summary
 Scanned Resources:	  2
 New Resources Traced: 	  2
 Updated Resources:	  0

New Resources Traced (2):
+----------------------------+-----------------------+----------------------+------------------------------------------+--------------------------------------+
|            FILE            |       RESOURCE        |       TAG KEY        |                TAG VALUE                 |                YOR ID                |
+----------------------------+-----------------------+----------------------+------------------------------------------+--------------------------------------+
| terraform/aws_instance.tf  | aws_instance.honeypot | yor_trace            | e1b8aec9-a9a6-4814-bfdd-f2373433f0c0     | e1b8aec9-a9a6-4814-bfdd-f2373433f0c0 |
+----------------------------+-----------------------+----------------------+------------------------------------------+--------------------------------------+
| terraform/aws_s3_bucket.tf | aws_s3_bucket.name    | yor_trace            | 78b1b7c4-03f9-4ec1-9ed6-1d0d8e7d9b94     | 78b1b7c4-03f9-4ec1-9ed6-1d0d8e7d9b94 |
+                            +                       +----------------------+------------------------------------------+                                      +
|                            |                       | git_repo             | yor-demo                                 |                                      |
+                            +                       +----------------------+------------------------------------------+                                      +
|                            |                       | git_org              | JamesWoolfenden                          |                                      |
+                            +                       +----------------------+------------------------------------------+                                      +
|                            |                       | git_modifiers        | James.Woolfenden                         |                                      |
+                            +                       +----------------------+------------------------------------------+                                      +
|                            |                       | git_last_modified_by | James.Woolfenden@gmail.com               |                                      |
+                            +                       +----------------------+------------------------------------------+                                      +
|                            |                       | git_last_modified_at | 2022-07-07 09:54:54                      |                                      |
+                            +                       +----------------------+------------------------------------------+                                      +
|                            |                       | git_file             | terraform/aws_s3_bucket.tf               |                                      |
+                            +                       +----------------------+------------------------------------------+                                      +
|                            |                       | git_commit           | 0e067cc9804c7f955a658cef97730ff649375a4e |                                      |
+----------------------------+-----------------------+----------------------+------------------------------------------+--------------------------------------+
```

You'll note the those resources have been modified:

```hcl
resource "aws_s3_bucket" "name" {

  tags = {
    git_commit           = "0e067cc9804c7f955a658cef97730ff649375a4e"
    git_file             = "terraform/aws_s3_bucket.tf"
    git_last_modified_at = "2022-07-07 09:54:54"
    git_last_modified_by = "James.Woolfenden@gmail.com"
    git_modifiers        = "James.Woolfenden"
    git_org              = "JamesWoolfenden"
    git_repo             = "yor-demo"
    yor_trace            = "78b1b7c4-03f9-4ec1-9ed6-1d0d8e7d9b94"
  }
}
```

## Simple tag group

You can define a tag group in your shell:

```bash
export YOR_SIMPLE_TAGS='{"pet": "mylovelyhorse", "tea": "decafwithmilk"}'
```

Then if you Yor:

```hcl
resource "aws_s3_bucket" "name" {

  tags = {
    git_commit           = "N/A"
    git_file             = "terraform/aws_s3_bucket.tf"
    git_last_modified_at = "2022-07-07 10:29:36"
    git_last_modified_by = "james.woolfenden@gmail.com"
    git_modifiers        = "James.Woolfenden/james.woolfenden"
    git_org              = "JamesWoolfenden"
    git_repo             = "yor-demo"
    yor_trace            = "78b1b7c4-03f9-4ec1-9ed6-1d0d8e7d9b94"
    pet                  = "mylovelyhorse"
    tea                  = "decafwithmilk"
  }
}
```

## Custom

You can define you own custom tagging structure:
<https://github.com/bridgecrewio/yor/blob/main/CUSTOMIZE.md>



pre-commit hook

build github action

Customizing:
<https://github.com/bridgecrewio/yor/blob/main/CUSTOMIZE.md>

Further reading:

<https://bridgecrew.io/blog/yor-checkov-governance-cicd/>
<https://bridgecrew.io/blog/using-yor-for-ownership-mapping-using-yaml-tag-groups/>
<https://bridgecrew.awsworkshop.io/terraform/40_module_two/2002_yor_github_action.html>
In the platform:

tag rules

drift detection as violation

api tag rules
