resource "aws_cognito_user_group" "this" {
  for_each = var.groups

  name         = each.key
  description  = lookup(each.value, "description", null)
  precedence   = lookup(each.value, "precedence", null)
  role_arn     = lookup(each.value, "role_arn", null)
  user_pool_id = aws_cognito_user_pool.this.id
}
