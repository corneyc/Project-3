# Azure subscription vars
#subscription_id = "e1b9dc3d-d767-4329-887b-85b9424a7d8b"
#client_id = "5ccd457b-d33d-45a6-873d-890ce5deb459"
#client_secret = "gk_Wzcfn8m9EczLUMGKQAAwUW1Co9WraFZ"
#tenant_id = "b45ee299-946a-42df-b77c-5368b672d85a"

# Resource Group/Location
location = "West Europe"
resource_group = "tstate-rg"
application_type = "test-app"

# Network
virtual_network_name = "vm1"
address_space = ["10.5.0.0/16"]
address_prefix_test = "10.5.1.0/24"

# VM
packer_image = "/subscriptions/e1b9dc3d-d767-4329-887b-85b9424a7d8b/resourceGroups/pimages/providers/Microsoft.Compute/images/packer-temp"
number_of_vms = 2 
admin_username = "corneyc"

# public key in azure pipelines
#public_key_path = "id_rsa.pub"

# public key on local machine
public_key_path = "~/.ssh/id_rsa.pub" 