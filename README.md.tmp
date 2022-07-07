# yor demo

yor: <https://memory-alpha.fandom.com/wiki/Yor>

Github:
<https://github.com/bridgecrewio/yor>

Install:

```shell
brew install yor
```

```powershell
choco install yor
```

Build:

basic usage at the cli

## list tags

```shell
yor list-tags
+------------+----------------------+--------------------------------+
|   GROUP    |       TAG KEY        |          DESCRIPTION           |
+------------+----------------------+--------------------------------+
| simple     |                      |                                |
+------------+----------------------+--------------------------------+
| external   |                      |                                |
+------------+----------------------+--------------------------------+
| code2cloud | yor_trace            | A UUID tag that allows easily  |
|            |                      | finding the root IaC config of |
|            |                      | the resource                   |
+------------+----------------------+--------------------------------+
| git        | git_org              | The entity which owns the      |
|            |                      | repository where this resource |
|            |                      | is provisioned in IaC          |
+            +----------------------+--------------------------------+
|            | git_repo             | The repository where this      |
|            |                      | resource is provisioned in IaC |
+            +----------------------+--------------------------------+
|            | git_file             | The file (including path)      |
|            |                      | in the repository where this   |
|            |                      | resource is provisioned in IaC |
+            +----------------------+--------------------------------+
|            | git_commit           | The hash of the latest commit  |
|            |                      | which edited this resource     |
+            +----------------------+--------------------------------+
|            | git_modifiers        | The users who modified this    |
|            |                      | resource                       |
+            +----------------------+--------------------------------+
|            | git_last_modified_at | The last time this resource's  |
|            |                      | configuration was modified     |
+            +----------------------+--------------------------------+
|            | git_last_modified_by | The last user who modified     |
|            |                      | this resource                  |
+------------+----------------------+--------------------------------+
```

Add simple tags

```
export YOR_SIMPLE_TAGS='{"horse": "mylovelyhorse", "tea": "yerwill"}'

$env:YOR_SIMPLE_TAGS='{"horse": "mylovelyhorse", "tea": "yerwill"}'
```

See the tags:

```shell
yor list-tags
+------------+----------------------+--------------------------------+
|   GROUP    |       TAG KEY        |          DESCRIPTION           |
+------------+----------------------+--------------------------------+
| simple     | horse                | Abstract tag class             |
+            +----------------------+--------------------------------+
|            | tea                  | Abstract tag class             |
+------------+----------------------+--------------------------------+
| external   |                      |                                |
+------------+----------------------+--------------------------------+
| code2cloud | yor_trace            | A UUID tag that allows easily  |
|            |                      | finding the root IaC config of |
|            |                      | the resource                   |
+------------+----------------------+--------------------------------+
| git        | git_org              | The entity which owns the      |
|            |                      | repository where this resource |
|            |                      | is provisioned in IaC          |
+            +----------------------+--------------------------------+
|            | git_repo             | The repository where this      |
|            |                      | resource is provisioned in IaC |
+            +----------------------+--------------------------------+
|            | git_file             | The file (including path)      |
|            |                      | in the repository where this   |
|            |                      | resource is provisioned in IaC |
+            +----------------------+--------------------------------+
|            | git_commit           | The hash of the latest commit  |
|            |                      | which edited this resource     |
+            +----------------------+--------------------------------+
|            | git_modifiers        | The users who modified this    |
|            |                      | resource                       |
+            +----------------------+--------------------------------+
|            | git_last_modified_at | The last time this resource's  |
|            |                      | configuration was modified     |
+            +----------------------+--------------------------------+
|            | git_last_modified_by | The last user who modified     |
|            |                      | this resource                  |
+------------+----------------------+--------------------------------+
```

define a tag group and use


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
