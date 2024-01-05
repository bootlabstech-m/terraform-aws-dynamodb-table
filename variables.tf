variable "region" {
  type = string
}
variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table.This name is unique within a region."
  type        = string
}

variable "billing_mode" {
  description = "Controls how you are billed for read/write throughput and how you manage capacity."
  type        = string
}

variable "hash_key" {
  description = "The attribute to used as the hash (partition) key. Must also be defined as an attribute"
  type        = string
}

variable "range_key" {
  description = "The attribute to use as the range (sort) key. Must also be defined as an attribute"
  type        = string
}

variable "read_capacity" {
  description = "The number of read units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  type        = number
}

variable "write_capacity" {
  description = "The number of write units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  type        = number
}
variable "stream_enabled" {
  description = "Indicates whether Streams are to be enabled (true) or disabled (false)."
  type        = bool
}
variable "deletion_protection_enabled" {
  description = "Indicates whether the DynamoDB table is protected against deletion or not."
  type        = bool
}
variable "table_class" {
  description = "The storage class of the table. Valid values are STANDARD and STANDARD_INFREQUENT_ACCESS"
  type        = string
}

variable "stream_view_type" {
  description = "(Optional) When an item in the table is modified, StreamViewType determines what information is written to the table's stream. Valid values are KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES."
  type        = string
}

variable "ttl_enabled" {
  description = "Indicates whether ttl is enabled"
  type        = bool
}

variable "ttl_attribute_name" {
  description = "The name of the table attribute to store the TTL timestamp in"
  type        = string
}

variable "point_in_time_recovery_enabled" {
  description = "Whether to enable point-in-time recovery"
  type        = bool
}

variable "server_side_encryption_enabled" {
  description = "Whether or not to enable encryption at rest using an AWS managed KMS customer master key (CMK)"
  type        = bool
}

variable "server_side_encryption_kms_key_arn" {
  description = "The ARN of the CMK that should be used for the AWS KMS encryption. This attribute should only be specified if the key is different from the default DynamoDB CMK, alias/aws/dynamodb."
  type        = string
}
variable "role_arn" {
  description = " The ARN of the IAM role"
  type        = string
}