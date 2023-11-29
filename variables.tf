variable "vpc_id" {
    default="vpc-03fdeb4b02fae31df"
}
variable "sg_name" {
default= "test_sg_1"
}
variable "web_sg" {
default= "web_test_sg_1"
}
variable "http" {
    default=80
}
variable "ssh" {
    default=22
} 


variable "cidr_ipv4" {
    default= ["0.0.0.0/0"]
}
variable "key_name"{
    default="myec2key"
}
variable "ami_id"{
default="ami-0fc5d935ebf8bc3bc"
}
    
variable "instance_type"{
    default="t2.micro"
}
# Make sure the SG provided is having access to HTTP and HTTPs
variable "subnet_1"{
    default="subnet-097fa3de77f2a5dc8"

}

variable "subnets" {
    type = list
    default = ["subnet-097fa3de77f2a5dc8","subnet-0efa9922c024bfb8e"]
}

variable "health_check" {
   type = map(string)
   default = {
      "timeout"  = "10"
      "interval" = "30"
      "path"     = "/"
      "port"     = "80"
      "unhealthy_threshold" = "2"
      "healthy_threshold" = "5"
    }
}
# Map used for providing details for health-check
# You can use the values based on your requirements



