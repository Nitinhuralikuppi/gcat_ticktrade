

##############################################################################
# Lookup resource objects needed for creating VSI.
##############################################################################

# VPC where VSI will be created
data ibm_is_vpc vpc {
    name = var.vpc_name
}

# SSH key for creating VSI
data ibm_is_ssh_key ssh_key {
    name = var.ssh_key_name
}


##############################################################################
# Provision VSI
##############################################################################

# Get the id of the subnet name
locals {
  vsi_subnet_ids = [
    for i in data.ibm_is_vpc.vpc.subnets: 
        i.id if var.vsi_vpc_subnet_name == i.name
  ]
}


# Image to be used (i.e. Ubuntu, redhat, etc)
data ibm_is_image vsi_image {
    name = var.vsi_image_name
}

resource ibm_is_instance vsi {
    name           = var.vsi_name
    resource_group = data.ibm_resource_group.resource_group.id
    tags           = var.tags
    image          = data.ibm_is_image.vsi_image.id
    profile        = var.vsi_machine_profile
    keys           = [data.ibm_is_ssh_key.ssh_key.id]
    vpc            = data.ibm_is_vpc.vpc.id
    zone           = var.vsi_vpc_zone
    primary_network_interface {
        name    = "eth0"
        subnet  = "0717-0efce8fd-7926-4ff2-a83f-7f1a9e117173"
    }   
}
