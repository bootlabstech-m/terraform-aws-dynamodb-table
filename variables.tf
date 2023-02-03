variable "region" {
  type    = string
}
variable "billing_mode" {
  description = "Controls how you are billed for read/write throughput and how you manage capacity. The valid values are PROVISIONED or PAY_PER_REQUEST"
  type        = string
}
variable "dynamodb_table_details" {
  description = "dynamodb_table_details"
  type        =  list(any)
}
/*variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}
variable "hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
}
variable "range_key" {
  description = "The attribute to use as the range (sort) key. Must also be defined as an attribute"
  type        = string
}
variable "stream_enabled" {
  description = "Indicates whether Streams are to be enabled (true) or disabled (false)."
  type        = bool
}
variable "table_class" {
  description = "The storage class of the table. Valid values are STANDARD and STANDARD_INFREQUENT_ACCESS"
  type        = string
}

variable "stream_view_type" {
  description = "(Optional) When an item in the table is modified, StreamViewType determines what information is written to the table's stream. Valid values are KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES."
  type        = string
  default     = null
}

variable "ttl_enabled" {
  description = "Indicates whether ttl is enabled"
  type        = bool
  default     = false
}

variable "ttl_attribute_name" {
  description = "The name of the table attribute to store the TTL timestamp in"
  type        = string
  default     = ""
}

variable "point_in_time_recovery_enabled" {
  description = "Whether to enable point-in-time recovery"
  type        = bool
  default     = true
}

variable "attributes" {
  description = "List of nested attribute definitions. Only required for hash_key and range_key attributes. Each attribute has two properties: name - (Required) The name of the attribute, type - (Required) Attribute type, which must be a scalar type: S, N, or B for (S)tring, (N)umber or (B)inary data"
  type        = list(map(string))
}



variable "global_secondary_indexes" {
  description = "Describe a GSI for the table; subject to the normal limits on the number of GSIs, projected attributes, etc."
  type        = any
  default     = []
}*/
variable "local_secondary_indexes" {
  description = "Describe an LSI on the table; these can only be allocated at creation so you cannot change this definition after you have created the resource."
  type        = any
  default     = []
}

variable "replica_regions" {
  description = "Region names for creating replicas for a global DynamoDB table."
  type        = any
  default     = []
}


variable "role_arn" {
  description = " The ARN of the IAM role"
  type = string
}