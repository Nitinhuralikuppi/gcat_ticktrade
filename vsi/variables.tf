##############################################################################
# Account Variables
##############################################################################

#variable ibmcloud_api_key {
#  description = "The IBM Cloud platform API key needed to deploy IAM enabled resources"
#  type        = string
#  default     = ""
#}

variable resource_group {
  description = "Name of resource group to create the VSI"
  type        = string
  default     = "ticktrade"
}

variable ibm_region {
  description = "IBM Cloud region where all resources will be deployed"
  type        = string
  default     = "us-east"
}

variable tags {
    description = "Enter any tags that you want to associate with VSI and associated resources."
    type        = list(string)
    default     = [
      "env:dev"
    ]
}




##############################################################################
# Common VSI Variables
##############################################################################

variable vpc_name {
  description = "Name of VPC where the VSI instance will be created"
  type        = string
  default     = "tt-vpc"
}

variable ssh_key_name {
  description = "Name of the ssh key to use for vsi."
  type        = string
  default     = "ssh-key"
}


##############################################################################
# VSI Variables
##############################################################################

variable vsi_name {
  description = "Name of the VSI instance to be created"
  type        = string
  default     = "tt-vsi"
}

variable vsi_image_name {
  description = "Image name used for VSI. Run 'ibmcloud is images' to find available images in a region"
  type        = string
  default     = "ibm-ubuntu-20-04-minimal-amd64-2"
}

variable vsi_machine_profile {
  description = "VSI machine profile (i.e. bx2-4x16). Run 'ibmcloud is instance-profiles' to get a list of regional profiles"
  type        =  string
  default     = "bx2-4x16"
}

variable vsi_vpc_zone {
  description = "Name of the zone where the VSI will be deployed (i.e. us-east-1, us-east-2, us-east-3, etc). Zone should match VPC region."
  type        = string
  default     = "us-east-1"
}

variable vsi_vpc_subnet_name {
  description = "Name of the subnet where the VSI will be deployed. Subnet MUST be part of the VPC and zone or else VSI creation will fail."
  type        = string
  default     = "subnet-az1-priv"
}

##############################################################################
