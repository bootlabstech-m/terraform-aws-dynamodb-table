resource "aws_dynamodb_table" "dynamodb_table" {
for_each           = { for dynamodb_table in var.dynamodb_table_details : dynamodb_table.dynamodb_table_name => dynamodb_table }
  name             = each.value.dynamodb_table_name
  hash_key         = each.value.hash_key
  range_key        = each.value.range_key
  stream_enabled   = each.value.stream_enabled
  stream_view_type = each.value.stream_view_type
  table_class      = each.value.table_class
  billing_mode     = var.billing_mode

  dynamic "attribute" {
    for_each = each.value.attributes

    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  ttl {
    enabled        = each.value.ttl_enabled
    attribute_name = each.value.ttl_attribute_name
  }

  point_in_time_recovery {
    enabled = each.value.point_in_time_recovery_enabled
  }

  dynamic "local_secondary_index" {
    for_each = var.local_secondary_indexes

    content {
      name               = local_secondary_index.value.name
      range_key          = local_secondary_index.value.range_key
      projection_type    = local_secondary_index.value.projection_type
      non_key_attributes = lookup(local_secondary_index.value, "non_key_attributes", null)
    }
  }

  dynamic "global_secondary_index" {
    for_each = each.value.global_secondary_indexes

    content {
      name               = global_secondary_index.value.name
      hash_key           = global_secondary_index.value.hash_key
      projection_type    = global_secondary_index.value.projection_type
      range_key          = lookup(global_secondary_index.value, "range_key", null)
      read_capacity      = lookup(global_secondary_index.value, "read_capacity", null)
      write_capacity     = lookup(global_secondary_index.value, "write_capacity", null)
      non_key_attributes = lookup(global_secondary_index.value, "non_key_attributes", null)
    }
  }

  dynamic "replica" {
    for_each = var.replica_regions

    content {
      region_name = replica.value.region_name
      kms_key_arn = lookup(replica.value, "kms_key_arn", null)
    }
  }


}