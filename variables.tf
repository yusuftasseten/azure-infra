variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "resource_group_location" {
  description = "Resource Group Location"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "vnet_address_space" {
  description = "CIDR Block"
  type        = list(string)
}

variable "snet_public_name" {
  description = "Public Subnet Name"
  type        = string
}

variable "snet_private_name" {
  description = "Private Subnet Name"
  type        = string
}

variable "public_address_prefixes" {
  description = "Public Address Prefixes"
  type        = list(string)
}

variable "private_address_prefixes" {
  description = "Private Address Prefixes"
  type        = list(string)
}

variable "nsg_name" {
  description = "Network Security Group Name"
  type        = string
}

variable "nsr_name" {
  description = "Network Security Rule Name"
  type        = string
}

variable "nsr_priority" {
  description = "The priority of the Network Security Rule (100-4096)"
  type        = number
}

variable "nsr_direction" {
  description = "Network Security Rule Direction (Inbound/Outbound)"
  type        = string
}

variable "nsr_access" {
  description = "Network Security Rule Access Type (Allow/Deny)"
  type        = string
}

variable "nsr_protocol" {
  description = "Network Protocol this rule applies to (TCP/UDP/ICMP/ESP/AH)"
  type        = string
}

variable "nsr_source_port_range" {
  description = "The Source Port Range this rule applies to"
  type        = string
}

variable "nsr_destination_port_range" {
  description = "The Destination Port Range this rule applies to"
  type        = string
}

variable "nsr_source_address_prefix" {
  description = "CIDR or source IP range or * to match any IP"
  type        = string
}

variable "nsr_destination_address_prefix" {
  description = "CIDR or destination IP range or * to match any IP"
  type        = string
}

variable "pip_name" {
  description = "Name of the Public IP Resource"
  type        = string
}

variable "pip_allocation_method" {
  description = "Allocation Method of the Public IP"
  type        = string
}

variable "nic_name" {
  description = "Name of the Network Interface"
  type        = string
}

variable "nic_ip_config_name" {
  description = "Name of the IP Configuration associated to the Network Interface"
  type        = string
}

variable "nic_ip_allocation_method" {
  description = "Allocation Method of the Private IP Address associated to the Network Interface"
  type        = string
}

variable "lvm_name" {
  description = "Name of the Linux Virtual Machine"
  type        = string
}

variable "lvm_location" {
  description = "Location of the Linux Virtual Machine"
  type        = string
}

variable "lvm_size" {
  description = "Size of the Linux Virtual Machine"
  type        = string
}

variable "lvm_adminuser" {
  description = "Adminuser of the Linux Virtual Machine"
  type        = string
}

variable "lvm_ssh_pub" {
  description = "The Public SSH Key for the VM"
  type        = string
}

variable "lvm_os_disk_caching" {
  description = "OS Disk Caching of the Linux Virtual Machine"
  type        = string
}

variable "lvm_os_disk_st_acc_type" {
  description = "OS Disk Storage Account Type of the Linux Virtual Machine"
  type        = string
}

variable "lvm_src_img_ref_publisher" {
  description = "Source Image Reference Publisher"
  type        = string
}

variable "lvm_src_img_ref_offer" {
  description = "Source Image Reference Offer"
  type        = string
}

variable "lvm_src_img_ref_sku" {
  description = "Source Image Reference SKU"
  type        = string
}

variable "lvm_src_img_version" {
  description = "Source Image Reference Version"
  type        = string
}