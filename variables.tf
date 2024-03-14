################# EC2 #########################
variable "ami_web" {
  type = string
  default = "ami-03bb6d83c60fc5f7c"
}

variable "ami_db" {
  type = string
  default = "ami-03bb6d83c60fc5f7c"
}

variable "instance_type_web" {
  type = string
  default = "t2.micro"
}

variable "instance_type_db" {
  type = string
  default = "t2.micro"
}

variable "key_name_web1" {
  type = string
  default = "youtube-key"
}

variable "key_name_web2" {
  type = string
  default = "youtube-key"
}

variable "key_name_db" {
  type = string
  default = "youtube-key"
}

################### cidrs #########################
variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "pub1_cidr" {
  type = string
  default = "10.0.1.0/24"
}

variable "pub2_cidr" {
  type = string
  default = "10.0.2.0/24"
}

variable "pvt_cidr" {
  type = string
  default = "10.0.3.0/24"
}

variable "route_cidr" {
  type = string
  default = "0.0.0.0/0"
}

############################# Avability zone #################################
variable "az_pub" {
  type = string
  default = "ap-south-1a"
}

variable "az_pvt" {
  type = string
  default = "ap-south-1b"
}

############ TAG SECTION ###############

variable "vpc_tags" {
  type = map 
  default = {
    Name = "CustomVPC"
  }
}

variable "pub1_sub_tags" {
  type = map
  default = {
    Name="public1 subnet"
  }
}

variable "pub2_sub_tags" {
  type = map
  default = {
    Name="public2 subnet"
  }
}

variable "pvt_sub_tags" {
  type = map
  default = {
    Name="private subnet"
  }
}

variable "route_web_tags" {
  type = map
  default = {
    Name= "MyWebRoute"
  }
}

variable "route_db_tags" {
  type = map
  default = {
    Name= "MydbRoute"
  }
}

variable "nat_gateway_tags" {
  type = map
  default = {
    Name = "gw NAT"
  }
}

variable "igw_tags" {
  type = map
  default = {
    Name = "IGW"
  }
}

variable "web1_tags" {
  type = map
  default =  {
    Name = "WebServer1"
  }
}

variable "web2_tags" {
  type = map
  default =  {
    Name = "WebServer2"
  }
}

variable "db_tags" {
  type = map
  default = {
    Name = "DB Server"
  }
}