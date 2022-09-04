resource "aws_cognito_user_pool" "this" {
  name                       = var.name
  alias_attributes           = var.alias_attributes
  auto_verified_attributes   = var.auto_verified_attributes
  username_attributes        = var.username_attributes
  mfa_configuration          = var.mfa_configuration
  sms_authentication_message = var.sms_authentication_message
  tags                       = merge(var.tags, { Name = var.name })

  username_configuration {
    case_sensitive = var.username_case_sensitive
  }

  email_configuration {
    configuration_set      = var.email_configuration_configuration_set
    email_sending_account  = var.email_configuration_email_sending_account
    from_email_address     = var.email_configuration_from_email_address
    reply_to_email_address = var.email_configuration_reply_to_email_address
    source_arn             = var.email_configuration_source_arn
  }

  admin_create_user_config {
    allow_admin_create_user_only = var.allow_admin_create_user_only

    invite_message_template {
      email_message = var.invite_message_email_message
      email_subject = var.invite_message_email_subject
      sms_message   = var.invite_message_sms_message
    }
  }

  user_pool_add_ons {
    advanced_security_mode = var.advanced_security_mode
  }

  verification_message_template {
    default_email_option  = var.verification_message_default_email_option
    email_message         = var.verification_message_email_message
    email_message_by_link = var.verification_message_email_message_by_link
    email_subject         = var.verification_message_email_subject
    email_subject_by_link = var.verification_message_email_subject_by_link
    sms_message           = var.verification_message_sms_message
  }

  password_policy {
    minimum_length                   = var.password_policy_minimum_length
    require_lowercase                = var.password_policy_require_lowercase
    require_numbers                  = var.password_policy_require_numbers
    require_symbols                  = var.password_policy_require_symbols
    require_uppercase                = var.password_policy_require_uppercase
    temporary_password_validity_days = var.password_policy_temporary_password_validity_days
  }

  lambda_config {
    create_auth_challenge          = var.lambda_create_auth_challenge_arn
    custom_message                 = var.lambda_custom_message_arn
    define_auth_challenge          = var.lambda_define_auth_challenge_arn
    post_authentication            = var.lambda_post_authentication_arn
    post_confirmation              = var.lambda_post_confirmation_arn
    pre_authentication             = var.lambda_pre_authentication_arn
    pre_sign_up                    = var.lambda_pre_sign_up_arn
    pre_token_generation           = var.lambda_pre_token_generation_arn
    user_migration                 = var.lambda_user_migration_arn
    verify_auth_challenge_response = var.lambda_verify_auth_challenge_response_arn
    kms_key_id                     = var.kms_key_id

    dynamic "custom_email_sender" {
      for_each = var.custom_email_sender_lambda_arn != null ? [{}] : []

      content {
        lambda_arn     = var.custom_email_sender_lambda_arn
        lambda_version = var.custom_email_sender_lambda_version
      }
    }

    dynamic "custom_sms_sender" {
      for_each = var.custom_sms_sender_lambda_arn != null ? [{}] : []

      content {
        lambda_arn     = var.custom_sms_sender_lambda_arn
        lambda_version = var.custom_sms_sender_lambda_version
      }
    }
  }

  dynamic "schema" {
    for_each = var.schemas

    content {
      name                     = schema.value.name
      attribute_data_type      = schema.value.attribute_data_type
      developer_only_attribute = lookup(schema.value, "developer_only_attribute", null)
      mutable                  = lookup(schema.value, "mutable", null)
      required                 = lookup(schema.value, "required", null)

      number_attribute_constraints {
        max_value = lookup(schema.value, "max_value", null)
        min_value = lookup(schema.value, "min_value", null)
      }

      string_attribute_constraints {
        max_length = lookup(schema.value, "max_length", null)
        min_length = lookup(schema.value, "min_length", null)
      }
    }
  }

  dynamic "account_recovery_setting" {
    for_each = length(var.account_recovery_options) > 0 ? [{}] : []

    content {
      dynamic "recovery_mechanism" {
        for_each = var.account_recovery_options

        content {
          name     = recovery_mechanism.value.name
          priority = recovery_mechanism.value.priority
        }
      }
    }
  }

  dynamic "device_configuration" {
    for_each = var.device_tracking_enabled ? [{}] : []

    content {
      challenge_required_on_new_device      = var.challenge_required_on_new_device
      device_only_remembered_on_user_prompt = var.device_only_remembered_on_user_prompt
    }
  }

  dynamic "sms_configuration" {
    for_each = var.sms_configuration_enabled ? [{}] : []

    content {
      external_id    = var.sms_configuration_external_id
      sns_caller_arn = var.sms_configuration_sns_caller_arn
    }
  }

  dynamic "software_token_mfa_configuration" {
    for_each = var.software_token_mfa_configuration_enabled ? [{}] : []

    content {
      enabled = var.software_token_mfa_configuration_enabled
    }
  }
}
