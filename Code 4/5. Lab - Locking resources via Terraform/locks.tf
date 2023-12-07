resource "azurerm_management_lock" "appvmlock" {
  name       = "appvm-lock1"
  scope      = azurerm_windows_virtual_machine.appvm.id
  lock_level = "ReadOnly"
  notes      = "No changes should be made to the virtual machine"
}