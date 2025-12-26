rg_dev = {
  rg1 = {
    name       = "dmitra-rg"
    location   = "Central India"
    managed_by = "terraform"
  }
}

net_dev = {
  vnet1 = {
    name                = "dmitra-vnet"
    location            = "Central India"
    resource_group_name = "dmitra-rg"
    address_space       = ["10.0.0.0/16"]
    subnets = {
      subnet1 = {
        name             = "front-subnet"
        address_prefixes = ["10.0.0.0/24"]
      }
      subnet2 = {
        name             = "back_subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet3 = {
        name             = "AzureBastionSubnet"
        address_prefixes = ["10.0.2.0/27"]
      }
    }
  }
}

pip_dev = {
  pip1 = {
    name                = "dmitra-pip"
    resource_group_name = "dmitra-rg"
    location            = "Central India"
    allocation_method   = "Static"
  }
}

nsg_dev = {
  nsg1 = {
    name                = "dmitra-nsg"
    location            = "Central India"
    resource_group_name = "dmitra-rg"
  }
}


vm_dev = {
  vm1 = {
    nic_name             = "dmitra-vm"
    resource_group_name  = "dmitra-rg"
    location             = "Central India"
    vm_name              = "dmitra-vm"
    size                 = "Standard_F2"
    caching              = "ReadWrite"
    admin_username       = "adminuser"
    admin_password       = "Debojyoti@1234"
    storage_account_type = "Standard_LRS"
    subnet_name          = "front-subnet"
    virtual_network_name = "dmitra-vnet"
    # pip_name             = "dmitra-pip"
    publisher  = "Canonical"
    offer      = "0001-com-ubuntu-server-jammy"
    sku        = "22_04-lts"
    version    = "latest"
 
  }
}

mssql_server_dev = {
  server1 = {
    name                         = "dmitra-server"
    resource_group_name          = "dmitra-rg"
    location                     = "Central India"
    version                      = "12.0"
    administrator_login          = "adminuser"
    administrator_login_password = "Debojyoti@1234"
    minimum_tls_version          = "1.2"
    tags = {
      environment = "dev"
    }
  }
}

mssql_db_dev = {
  sql_db1 = {
    name         = "dmitra-db"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_name = "VBS"
    tags = {
      environment = "dev"
    }
    server_name         = "dmitra-server"
    resource_group_name = "dmitra-rg"
  }
}

bastion_dev = {
  bash1 = {
    bation_host_name      = "jump_server_bash"
    location              = "Central India"
    resource_group_name   = "dmitra-rg"
    ip_configuration_name = "configuration"
    subnet_name           = "AzureBastionSubnet"
    virtual_network_name  = "dmitra-vnet"
    bastion_pip_name      = "dmitra-pip"
  }
}
