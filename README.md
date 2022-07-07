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

### Simple tag group

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

### Grouping

You can define your own tag groups and members in a config file (see tag-groups.yml):

```yml
tag_groups:
  - name: ownership # map infrastructure to owner or owning team
    tags:
      - name: env
        value:
          default: ${env:GITHUB_HEAD_REF} # environment name would be the name of the feature_branch
      - name: team_ownership
        value:
          default: sre # SRE are the default owning team of cloud resources
          matches:
            - security_engineering:
                tags:
                  git_modifiers: # security engineering team member's GitHub handles
                    - rotemavni
                    - tronxd
                    - nimrodkor
            - platform_engineering:
                tags:
                  git_modifiers: # platform engineering team member's GitHub handles
                    - milkana
                    - nofar
            - solution_architecture:
                tags:
                  git_modifiers:
                    - james.woolfenden
                    - James.Woolfenden
                    - jameswoolfenden
            - application:
                tags:
                  git_modifiers:
                    - schosterbarak
```

Now when you run with the group and tag:

```cli
$yor tag -config-file tag-groups.yml -d terraform/
```

The tags and grouping are now associated:

```hcl
resource "aws_instance" "honeypot" {
  tags = {
    git_commit           = "587cbf999252fc49b7d6fbfc5a7ac3c5b2c8c8a0"
    git_file             = "terraform/aws_instance.tf"
    git_last_modified_at = "2022-07-07 10:36:20"
    git_last_modified_by = "james.woolfenden@gmail.com"
    git_modifiers        = "james.woolfenden"
    git_org              = "JamesWoolfenden"
    git_repo             = "yor-demo"
    pet                  = "mylovelyhorse"
    tea                  = "decafwithmilk"
    yor_trace            = "9237d214-75e0-43e1-91ef-1cbcf3076337"
    env                  = "$${env:GITHUB_HEAD_REF}"
    team_ownership       = "solution_architecture"
  }
}
```

### Custom

You can also define you own custom tagging structure:
<https://github.com/bridgecrewio/yor/blob/main/CUSTOMIZE.md>

## Locking it all in

So far all we have done is execute yor at the Cli, how can I Aautomate these tags to ensure that they get associated at runtime?

### Pre-commit hook

If you configure your repositories to use the Yor Pre-commit hook you can lock these values into codebase and hopefully to any deployment
If you've previously installed pre-commit from pip all you need to do is add or update your .pre-commit-config.yaml:

```yaml
  - repo: https://github.com/bridgecrewio/yor
    rev: 0.1.148
    hooks:
      - id: yor
        name: yor
        entry: yor tag -d
        args: ["."]
        language: golang
        types: [terraform]
        pass_filenames: false
```

Then when you try to commit your code it will ensure that you have applied Yor tags...

### Github action

Of course, to be really sure you can add it to your final gate your CICD tool as well:

```yml
name: IaC trace

on:
  # Triggers the workflow on push or pull request events but only for the main branch
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

jobs:
  yor:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
        name: Checkout repo
        with:
          fetch-depth: 0
          ref: ${{ github.head_ref }}
      - name: Run yor action and commit
        uses: bridgecrewio/yor-action@main
```

Further reading:

<https://bridgecrew.io/blog/yor-checkov-governance-cicd/>
<https://bridgecrew.io/blog/using-yor-for-ownership-mapping-using-yaml-tag-groups/>
<https://bridgecrew.awsworkshop.io/terraform/40_module_two/2002_yor_github_action.html>

## In the Bridgecrew platform

### Tag rules

Open <https://www.bridgecrew.cloud/resourceInventory/tagManagement> and you can manage the tag rules and how they are applied to your connected repos.
If you enable a rule against a repo and it is not compliant, a PR will be raised against the code to make it so.
The tags tag rules can be simple or complex:
<https://docs.bridgecrew.io/docs/manage-tag-rules>

### drift detection as violation

With Rules enables and yor_trace tags defined a relationship between the checked in code and the the deployed runtime version can exist. Any deviations or `drift` is then raised as a violation:
<https://www.bridgecrew.cloud/incidents?sort=severity&search=&categories=Drift&status=OPEN>

Platform docs:<https://docs.bridgecrew.io/docs/drift-detection>

### api tag rules

A public API is available for the management of tag rules: <https://docs.bridgecrew.io/reference/gettags>

Alternatively you can manage these via Our/my Terraform Provider <https://registry.terraform.io/providers/PaloAltoNetworks/bridgecrew/latest/docs/resources/tag>
