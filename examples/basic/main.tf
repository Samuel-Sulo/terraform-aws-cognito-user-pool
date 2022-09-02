provider "aws" {
  region = "eu-west-1"
}

module "user_pool" {
  source = "../../"

  name                         = "test"
  allow_admin_create_user_only = true

  account_recovery_options = [
    {
      name     = "verified_email"
      priority = 1
    }
  ]

  invite_message_email_message = "Your username is {username}, your temporary password is {####}"
  invite_message_email_subject = "Welcome to ..."
  invite_message_sms_message   = "Your username is {username}, your temporary password is {####}"

  alias_attributes         = ["email"]
  auto_verified_attributes = ["email"]

  device_tracking_enabled               = false
  challenge_required_on_new_device      = false
  device_only_remembered_on_user_prompt = true

  # email_configuration_email_sending_account = "DEVELOPER"
  # email_configuration_source_arn            = aws_ses_email_identity.test.arn

  # lambda_create_auth_challenge_arn          = ""
  # lambda_custom_message_arn                 = ""
  # lambda_define_auth_challenge_arn          = ""
  # lambda_post_authentication_arn            = ""
  # lambda_post_confirmation_arn              = ""
  # lambda_pre_authentication_arn             = ""
  # lambda_pre_sign_up_arn                    = ""
  # lambda_pre_token_generation_arn           = ""
  # lambda_user_migration_arn                 = ""
  # lambda_verify_auth_challenge_response_arn = ""
  # custom_email_sender_lambda_arn            = ""
  # custom_sms_sender_lambda_arn              = ""
  # kms_key_id                                = ""

  # mfa_configuration = "ON"

  # schemas = [
  #   {
  #     name                = "id"
  #     attribute_data_type = "String"
  #     max_length          = 20
  #     min_length          = 20
  #   },
  #   {
  #     name                = "number"
  #     attribute_data_type = "Number"
  #     max_value           = 2000
  #     min_value           = 200
  #   },
  #   {
  #     name                = "bool"
  #     attribute_data_type = "Boolean"
  #   },
  #   {
  #     name                = "joined_at"
  #     attribute_data_type = "DateTime"
  #   }
  # ]

  verification_message_default_email_option  = "CONFIRM_WITH_LINK"
  verification_message_email_message         = "Code {####}"
  verification_message_email_message_by_link = "Link {##Click Here##}"
  verification_message_email_subject         = "With Code"
  verification_message_email_subject_by_link = "With Link"
  verification_message_sms_message           = "SMS Code {####}"
}
