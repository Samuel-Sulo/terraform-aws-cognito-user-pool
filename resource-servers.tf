resource "aws_cognito_resource_server" "this" {
  for_each = var.resource_servers

  name       = each.key
  identifier = each.value.identifier

  dynamic "scope" {
    for_each = each.value.scopes

    content {
      scope_name        = scope.value.scope_name
      scope_description = scope.value.scope_description
    }
  }

  user_pool_id = aws_cognito_user_pool.this.id
}
