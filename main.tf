resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "public" {
  name                 = var.snet_public_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.public_address_prefixes
}

resource "azurerm_subnet" "private" {
  name                 = var.snet_private_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.private_address_prefixes
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet_network_security_group_association" "snet_nsg_link" {
  subnet_id                 = azurerm_subnet.public.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_network_security_rule" "nsr" {
  name                        = var.nsr_name
  priority                    = var.nsr_priority
  direction                   = var.nsr_direction
  access                      = var.nsr_access
  protocol                    = var.nsr_protocol
  source_port_range           = var.nsr_source_port_range
  destination_port_range      = var.nsr_destination_port_range
  source_address_prefix       = var.nsr_source_address_prefix
  destination_address_prefix  = var.nsr_destination_address_prefix
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_public_ip" "pip" {
  name                = var.pip_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = var.pip_allocation_method
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.nic_ip_config_name
    subnet_id                     = azurerm_subnet.public.id
    private_ip_address_allocation = var.nic_ip_allocation_method
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "lvm" {
  name                = var.lvm_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.lvm_size
  admin_username      = var.lvm_adminuser
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  allow_extension_operations=false
  
  admin_ssh_key {
    username   = var.lvm_adminuser
    public_key = var.lvm_ssh_pub
  }

  os_disk {
    caching              = var.lvm_os_disk_caching
    storage_account_type = var.lvm_os_disk_st_acc_type
  }

  source_image_reference {
    publisher = var.lvm_src_img_ref_publisher
    offer     = var.lvm_src_img_ref_offer
    sku       = var.lvm_src_img_ref_sku
    version   = var.lvm_src_img_version
  }
}