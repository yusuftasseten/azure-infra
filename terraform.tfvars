resource_group_name     = "rg-azure-infra-dev-gwc"
resource_group_location = "germanywestcentral"

vnet_name          = "vnet-azure-infra-dev-gwc"
vnet_address_space = ["10.0.0.0/16"]

snet_public_name  = "snet-public-dev-gwc"
snet_private_name = "snet-private-dev-gwc"

public_address_prefixes  = ["10.0.1.0/24"]
private_address_prefixes = ["10.0.2.0/24"]

nsg_name                       = "nsg-public-dev-gwc"
nsr_name                       = "allow-ssh-inbound"
nsr_priority                   = 100
nsr_direction                  = "Inbound"
nsr_access                     = "Allow"
nsr_protocol                   = "Tcp"
nsr_source_port_range          = "*"
nsr_destination_port_range     = "22"
nsr_source_address_prefix      = "*"
nsr_destination_address_prefix = "*"

pip_name              = "pip-azure-infra-dev-gwc"
pip_allocation_method = "Static"

nic_name                 = "nic-azure-infra-dev-gwc"
nic_ip_config_name       = "internal"
nic_ip_allocation_method = "Dynamic"

lvm_name                  = "vm-linux-dev-gwc"
lvm_location              = "value"
lvm_size                  = "Standard_F2als_v6"
lvm_adminuser             = "azureuser"
lvm_os_disk_caching       = "ReadWrite"
lvm_os_disk_st_acc_type   = "Standard_LRS"
lvm_src_img_ref_publisher = "canonical"
lvm_src_img_ref_offer     = "ubuntu-24_04-lts"
lvm_src_img_ref_sku       = "server"
lvm_src_img_version       = "latest"