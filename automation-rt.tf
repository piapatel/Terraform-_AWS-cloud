resource "aws_route_table" "week5" {
  vpc_id = aws_vpc.week5.id

  route = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.week5.id
      # This is all very silly!
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      nat_gateway_id             = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      local_gateway_id           = ""
    },

  ]

  tags = {
    Name = "week5-rt"
  }
}
