resource "aws_dynamodb_table" "dynamodb_table" {
  name             = var.dynamodb_table_name
  hash_key         = var.hash_key
  range_key        = var.range_key
  billing_mode     = var.billing_mode

  read_capacity    = var.read_capacity
  write_capacity   = var.write_capacity
  stream_enabled   = var.stream_enabled
  stream_view_type = var.stream_view_type
  table_class      = var.table_class
  deletion_protection_enabled = var.deletion_protection_enabled

  attribute {
    name = var.hash_key
    type = "S"
  }

  attribute {
    name = var.range_key
    type = "S"
  }

  ttl {
    enabled        = var.ttl_enabled
    attribute_name = var.ttl_attribute_name
  }

  point_in_time_recovery {
    enabled = var.point_in_time_recovery_enabled
  }

  # dynamic "local_secondary_index" {
  #   for_each = var.local_secondary_indexes

  #   content {
  #     name               = local_secondary_index.value.name
  #     range_key          = local_secondary_index.value.range_key
  #     projection_type    = local_secondary_index.value.projection_type
  #     non_key_attributes = lookup(local_secondary_index.value, "non_key_attributes", null)
  #   }
  # }

  # dynamic "global_secondary_index" {
  #   for_each = var.global_secondary_indexes

  #   content {
  #     name               = global_secondary_index.value.name
  #     hash_key           = global_secondary_index.value.hash_key
  #     projection_type    = global_secondary_index.value.projection_type
  #     range_key          = lookup(global_secondary_index.value, "range_key", null)
  #     read_capacity      = lookup(global_secondary_index.value, "read_capacity", null)
  #     write_capacity     = lookup(global_secondary_index.value, "write_capacity", null)
  #     non_key_attributes = lookup(global_secondary_index.value, "non_key_attributes", null)
  #   }
  # }

  # dynamic "replica" {
  #   for_each = var.replica_regions

  #   content {
  #     region_name = replica.value.region_name
  #     kms_key_arn = var.server_side_encryption_kms_key_arn
  #   }
  # }

  server_side_encryption {
    enabled     = var.server_side_encryption_enabled
    kms_key_arn = var.server_side_encryption_kms_key_arn
  }

  lifecycle {
     ignore_changes = [replica,read_capacity,write_capacity] 
  }
}
# resource "aws_appautoscaling_target" "dynamodb_table_read_target" {
#   max_capacity       = 100
#   min_capacity       = 5
#   resource_id        = aws_dynamodb_table.dynamodb_table.name
#   scalable_dimension = "dynamodb:table:ReadCapacityUnits"
#   service_namespace  = "dynamodb"
# }

# resource "aws_appautoscaling_policy" "dynamodb_table_read_policy" {
#   name               = "DynamoDBReadCapacityUtilization:${aws_appautoscaling_target.dynamodb_table_read_target.resource_id}"
#   policy_type        = "TargetTrackingScaling"
#   resource_id        = aws_appautoscaling_target.dynamodb_table_read_target.resource_id
#   scalable_dimension = aws_appautoscaling_target.dynamodb_table_read_target.scalable_dimension
#   service_namespace  = aws_appautoscaling_target.dynamodb_table_read_target.service_namespace

#   target_tracking_scaling_policy_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "DynamoDBReadCapacityUtilization"
#     }

#     target_value = 70
#   }
# }