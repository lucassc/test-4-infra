
data "azurerm_subnet" "jump_station" {
  name                 = var.subnet_jump_station_name
  resource_group_name  = var.subnet_jump_station_resource_group
  virtual_network_name = var.vnet_jump_station_name
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.project_name}-${var.environment}-jump-station-nic"
  location            = var.location
  resource_group_name = var.subnet_jump_station_resource_group

  ip_configuration {
    name                          = "configuration"
    subnet_id                     = data.azurerm_subnet.jump_station.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_shh_key" {
  filename        = "./jump-station-vm_key.pem"
  content         = tls_private_key.ssh.private_key_pem
  file_permission = "0400"
}


resource "azurerm_virtual_machine" "jump_station" {
  name                  = "${var.project_name}-${var.environment}-jump-station-vm"
  location              = var.location
  resource_group_name   = var.jump_station_resource_group
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = "Standard_DC1s_v2"


  delete_data_disks_on_termination = true
  delete_os_disk_on_termination    = true

  storage_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.project_name}-${var.environment}-jump-station-vm_OsDisk_1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  os_profile {
    admin_username = "azureuser"
    computer_name  = "${var.project_name}-${var.environment}-jump-station-vm"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      key_data = tls_private_key.ssh.public_key_openssh
      path     = "/home/azureuser/.ssh/authorized_keys"
    }
  }


  tags = var.tags
}
