resource "azurerm_monitor_action_group" "email_alert" {
  name                = "email-alert"
  resource_group_name = local.resource_group_name
  short_name          = "email-alert"

  email_receiver {
    name          = "send-email-alert"
    email_address = "iabhinanditha@gmail.com"
    use_common_alert_schema = true
  }
}