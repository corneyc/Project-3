#terraform {
  #required_providers {
    #azurerm = {
      #source  = "hashicorp/azurerm"
      #version = "=2.48.0"
    #}
  #}
#}
provider "azurerm" {
  #tenant_id       = var.tenant_id
  #subscription_id = var.subscription_id
  #lient_id       = var.client_id
  #client_secret   = var.client_secret*/
  features {}
}
terraform {
  backend "azurerm" {
    storage_account_name = "tstate2904"
    container_name       = "tstate-cn"
    key                  = "terraform.tfstate"
    access_key           = "MEokYeA/hfvbXfT+b1kOJZwBfHBgFtFKeyLvIWTNa3FgMKhhfkFxPdTmJJbXBR2Nww8MANmxJsSOuLxScUxXoA=="
  }
}
 module "resource_group" {
  source               = "../../modules/resource_group"
  resource_group       = var.resource_group
  location             = var.location
}
module "network" {
  source               = "../../modules/network"
  address_space        = var.address_space
  location             = var.location
  virtual_network_name = var.virtual_network_name
  application_type     = var.application_type
  resource_type        = "NET"
  resource_group       = module.resource_group.resource_group_name
  address_prefix_test  = var.address_prefix_test
}
module "nsg-test" {
  source              = "../../modules/networksecuritygroup"
  location            = var.location
  application_type    = var.application_type
  resource_type       = "NSG"
  resource_group      = module.resource_group.resource_group_name
  subnet_id           = module.network.subnet_id_test
  address_prefix_test = var.address_prefix_test
}
module "appservice" {
  source           = "../../modules/appservice"
  location         = var.location
  application_type = var.application_type
  resource_type    = "AppService"
  resource_group   = module.resource_group.resource_group_name
}
module "publicip" {
  source           = "../../modules/publicip"
  location         = var.location
  application_type = var.application_type
  resource_type    = "publicip"
  resource_group   = module.resource_group.resource_group_name
}
module "vm" {
  source               = "../../modules/vm"
  number_of_vms        = var.number_of_vms
  location             = var.location
  resource_group       = module.resource_group.resource_group_name
  resource_type        = "vm"

  admin_username       = var.admin_username
  subnet_id_test       = module.network.subnet_id_test
  instance_ids         = module.publicip.public_ip_address_id
  packer_image         = var.packer_image
  public_key_path      = var.public_key_path
}