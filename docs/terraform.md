## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |
| aws | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| source\_documents | List of JSON IAM policy documents.<br/><br/><b>Limits:</b><br/>\* List size max 10<br/> \* Statement can be overriden by the statement with the same sid from the latest policy. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| result\_document | Aggregated IAM policy |

