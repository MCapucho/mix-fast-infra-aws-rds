variable "region" {
  default = "us-east-1"
}

variable "tags" {
  type = map(string)
  default     = {
    "name" : "mixfast"
    "company" : "fiap"
  }
}

variable "name" {
  type = string
  default = "mixfast"
}

variable "vpc_id" {
  default = "vpc-0a435ade90a13efbd"
}
variable "subnet_ids" {
  type = list
  default = ["subnet-0406a873952617bd6", "subnet-071f09ce851e88eee", "subnet-08f89a38c4c56076f"]
}
variable "engine" {
  description = "The database engine"
  type = string
  default = "mysql"
}
variable "allocated_storage" {
  description = "The amount of allocated storage."
  type = number
  default = 20
}
variable "storage_type" {
  description = "type of the storage"
  type = string
  default = "gp2"
}
variable "username" {
  description = "Username for the master DB user."
  type = string
  default = "mixfast"
}
variable "instance_class" {
  description = "The RDS instance class"
  type = string
  default = "db.t3.micro"
}
variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate"
  type = string
  default = "default.mysql8.0"
}
variable "skip_final_snapshot" {
  description = "skip snapshot"
  type = string
  default = "true"
}
variable "identifier" {
  description = "The name of the RDS instance"
  type = string
  default = "dbmixfast"
}
variable "port" {
  description = "The port on which the DB accepts connections"
  type = number
  default = "3306"
}
variable "database_name" {
  description = "The database name"
  type = string
  default = "dbmixfast"
}
variable "from_port_ingress" {
  type = number
  default = 3306
}
variable "to_port_ingress" {
  type = number
  default = 3306
}
variable "protocol_ingress" {
  type = string
  default = "TCP"
}
variable "from_port_egress" {
  type = number
  default = 0
}
variable "to_port_egress" {
  type = number
  default = 0
}
variable "protocol_egress" {
  type = string
  default = "-1"
}