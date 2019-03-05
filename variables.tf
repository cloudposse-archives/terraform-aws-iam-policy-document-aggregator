variable "source_documents" {
  type        = "list"
  description = "List of JSON IAM policy documents.<br/><br/><b>Limits:</b><br/>* List size max 10<br/> * Statement can be overriden by the statement with the same sid from the latest policy."
  default     = []
}
