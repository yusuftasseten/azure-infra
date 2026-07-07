output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "snet_public_id" {
  value = azurerm_subnet.public.id
}

output "snet_private_id" {
  value = azurerm_subnet.private.id
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}

output "pip" {
  value = azurerm_public_ip.pip.ip_address
}

output "nic" {
  value = azurerm_network_interface.nic.private_ip_address
}

output "lvm_id" {
  value = azurerm_linux_virtual_machine.lvm.id
}