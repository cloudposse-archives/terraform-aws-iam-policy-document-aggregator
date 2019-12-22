## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| source_documents | List of JSON IAM policy documents.<br/><br/><b>Limits:</b><br/>* List size max 10<br/> * Statement can be overriden by the statement with the same sid from the latest policy. | list(string) | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| result_document | Aggregeted IAM policy |

