# USER POOL

variable "name" {
  description = "(Required) Name of the user pool."
  type        = string
}

variable "account_recovery_options" {
  description = "(Optional) List of account recovery options."
  type        = list(map(string))
  default     = []
}

variable "allow_admin_create_user_only" {
  description = "(Optional) Set to True if only the administrator is allowed to create user profiles. Set to False if users can sign themselves up via an app."
  type        = bool
  default     = false
}

variable "invite_message_email_message" {
  description = "(Optional) Message template for email messages. Must contain {username} and {####} placeholders, for username and temporary password, respectively."
  type        = string
  default     = null
}

variable "invite_message_email_subject" {
  description = "(Optional) Subject line for email messages."
  type        = string
  default     = null
}

variable "invite_message_sms_message" {
  description = "(Optional) Message template for SMS messages. Must contain {username} and {####} placeholders, for username and temporary password, respectively."
  type        = string
  default     = null
}

variable "alias_attributes" {
  description = "(Optional) Attributes supported as an alias for this user pool. Valid (Optional) Whether a challenge is required on a new device. Only applicable to a new device.s: phone_number, email, or preferred_username. Conflicts with username_attributes."
  type        = set(string)
  default     = null
}

variable "auto_verified_attributes" {
  description = "(Optional) Attributes to be auto-verified. Valid values: email, phone_number."
  type        = set(string)
  default     = null
}

variable "device_tracking_enabled" {
  description = "(Optional) Whether to enable device tracking."
  type        = bool
  default     = false
}

variable "challenge_required_on_new_device" {
  description = "(Optional) Whether a challenge is required on a new device. Only applicable to a new device."
  type        = bool
  default     = false
}

variable "device_only_remembered_on_user_prompt" {
  description = "(Optional) Whether a device is only remembered on user prompt. false equates to 'Always' remember, true is 'User Opt In', and not using a device_configuration block is 'No'."
  type        = bool
  default     = false
}

variable "email_configuration_configuration_set" {
  description = "(Optional) Email configuration set name from SES."
  type        = string
  default     = null
}

variable "email_configuration_email_sending_account" {
  description = "(Optional) Email delivery method to use. COGNITO_DEFAULT for the default email functionality built into Cognito or DEVELOPER to use your Amazon SES configuration."
  type        = string
  default     = null
}

variable "email_configuration_from_email_address" {
  description = "(Optional) Sender's email address or sender's display name with their email address (e.g., john@example.com, John Smith <john@example.com> or \"John Smith Ph.D.\" <john@example.com>). Escaped double quotes are required around display names that contain certain characters as specified in RFC 5322."
  type        = string
  default     = null
}

variable "email_configuration_reply_to_email_address" {
  description = "(Optional) REPLY-TO email address."
  type        = string
  default     = null
}

variable "email_configuration_source_arn" {
  description = "(Optional) ARN of the SES verified email identity to to use. Required if email_sending_account is set to DEVELOPER."
  type        = string
  default     = null
}

variable "lambda_create_auth_challenge_arn" {
  description = "(Optional) ARN of the lambda creating an authentication challenge."
  type        = string
  default     = null
}

variable "lambda_custom_message_arn" {
  description = "(Optional) Custom Message AWS Lambda trigger."
  type        = string
  default     = null
}

variable "lambda_define_auth_challenge_arn" {
  description = "(Optional) Defines the authentication challenge."
  type        = string
  default     = null
}

variable "lambda_post_authentication_arn" {
  description = "(Optional) Post-authentication AWS Lambda trigger."
  type        = string
  default     = null
}

variable "lambda_post_confirmation_arn" {
  description = "(Optional) Post-confirmation AWS Lambda trigger."
  type        = string
  default     = null
}

variable "lambda_pre_authentication_arn" {
  description = "(Optional) Pre-authentication AWS Lambda trigger."
  type        = string
  default     = null
}

variable "lambda_pre_sign_up_arn" {
  description = "(Optional) Pre-registration AWS Lambda trigger."
  type        = string
  default     = null
}

variable "lambda_pre_token_generation_arn" {
  description = "(Optional) Allow to customize identity token claims before token generation."
  type        = string
  default     = null
}

variable "lambda_user_migration_arn" {
  description = "(Optional) User migration Lambda config type."
  type        = string
  default     = null
}

variable "lambda_verify_auth_challenge_response_arn" {
  description = "(Optional) Verifies the authentication challenge response."
  type        = string
  default     = null
}

variable "kms_key_id" {
  description = "(Optional) The Amazon Resource Name of Key Management Service Customer master keys. Amazon Cognito uses the key to encrypt codes and temporary passwords sent to CustomEmailSender and CustomSMSSender."
  type        = string
  default     = null
}

variable "custom_email_sender_lambda_arn" {
  description = "(Optional) The Lambda Amazon Resource Name of the Lambda function that Amazon Cognito triggers to send email notifications to users."
  type        = string
  default     = null
}

variable "custom_email_sender_lambda_version" {
  description = "(Optional) The Lambda version represents the signature of the 'request' attribute in the 'event' information Amazon Cognito passes to your custom email Lambda function. The only supported value is V1_0."
  type        = string
  default     = "V1_0"
}

variable "custom_sms_sender_lambda_arn" {
  description = "(Optional) The Lambda Amazon Resource Name of the Lambda function that Amazon Cognito triggers to send SMS notifications to users."
  type        = string
  default     = null
}

variable "custom_sms_sender_lambda_version" {
  description = "(Optional) The Lambda version represents the signature of the 'request' attribute in the 'event' information Amazon Cognito passes to your custom SMS Lambda function. The only supported value is V1_0."
  type        = string
  default     = "V1_0"
}

variable "mfa_configuration" {
  description = "(Optional) Multi-Factor Authentication (MFA) configuration for the User Pool. Defaults of OFF. Valid values are OFF (MFA Tokens are not required), ON (MFA is required for all users to sign in; requires at least one of sms_configuration or software_token_mfa_configuration to be configured), or OPTIONAL (MFA Will be required only for individual users who have MFA Enabled; requires at least one of sms_configuration or software_token_mfa_configuration to be configured)."
  type        = string
  default     = null
}

variable "password_policy_minimum_length" {
  description = "(Optional) Minimum length of the password policy that you have set."
  type        = number
  default     = 8
}

variable "password_policy_require_lowercase" {
  description = "(Optional) Whether you have required users to use at least one lowercase letter in their password."
  type        = bool
  default     = true
}

variable "password_policy_require_numbers" {
  description = "(Optional) Whether you have required users to use at least one number in their password."
  type        = bool
  default     = true
}

variable "password_policy_require_symbols" {
  description = "(Optional) Whether you have required users to use at least one symbol in their password."
  type        = bool
  default     = true
}

variable "password_policy_require_uppercase" {
  description = "(Optional) Whether you have required users to use at least one uppercase letter in their password."
  type        = bool
  default     = true
}

variable "password_policy_temporary_password_validity_days" {
  description = "(Optional) In the password policy you have set, refers to the number of days a temporary password is valid. If the user does not sign-in during this time, their password will need to be reset by an administrator."
  type        = number
  default     = 7
}

variable "schemas" {
  description = "(Optional) List of schema attributes of the user pool."
  type        = list(map(string))
  default     = []
}

variable "sms_authentication_message" {
  description = "(Optional) String representing the SMS authentication message. The Message must contain the {####} placeholder, which will be replaced with the code."
  type        = string
  default     = null
}

variable "sms_configuration_enabled" {
  description = "(Optional) Whether to enable to sms configuration."
  type        = bool
  default     = false
}

variable "sms_configuration_external_id" {
  description = "(Optional) External ID used in IAM role trust relationships."
  type        = string
  default     = null
}

variable "sms_configuration_sns_caller_arn" {
  description = "(Optional) ARN of the Amazon SNS caller. This is usually the IAM role that you've given Cognito permission to assume."
  type        = string
  default     = null
}

variable "software_token_mfa_configuration_enabled" {
  description = "(Optional) Whether to enable software token Multi-Factor (MFA) tokens, such as Time-based One-Time Password (TOTP)."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Map of tags to assign to the User Pool. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type        = map(string)
  default     = null
}

variable "advanced_security_mode" {
  description = "(Optional) Mode for advanced security, must be one of OFF, AUDIT or ENFORCED."
  type        = string
  default     = "OFF"
}

variable "username_attributes" {
  description = "(Optional) Whether email addresses or phone numbers can be specified as usernames when a user signs up. Conflicts with alias_attributes."
  type        = set(string)
  default     = null
}

variable "username_case_sensitive" {
  description = "(Optional, Forces replacement) Whether username case sensitivity will be applied for all users in the user pool through Cognito APIs."
  type        = bool
  default     = false
}

variable "verification_message_default_email_option" {
  description = "(Optional) Default email option. Must be either CONFIRM_WITH_CODE or CONFIRM_WITH_LINK. Defaults to CONFIRM_WITH_CODE."
  type        = string
  default     = null
}

variable "verification_message_email_message" {
  description = "(Optional) Email message template. Must contain the {####} placeholder."
  type        = string
  default     = null
}

variable "verification_message_email_message_by_link" {
  description = "(Optional) Email message template for sending a confirmation link to the user, it must contain the {##Click Here##} placeholder."
  type        = string
  default     = null
}

variable "verification_message_email_subject" {
  description = "(Optional) Subject line for the email message template."
  type        = string
  default     = null
}

variable "verification_message_email_subject_by_link" {
  description = "(Optional) Subject line for the email message template for sending a confirmation link to the user."
  type        = string
  default     = null
}

variable "verification_message_sms_message" {
  description = "(Optional) SMS message template. Must contain the {####} placeholder. Conflicts with sms_verification_message argument."
  type        = string
  default     = null
}


# GROUPS
variable "groups" {
  description = "(Optional) List of cognito user groups."
  type        = map(map(string))
  default     = {}
}
