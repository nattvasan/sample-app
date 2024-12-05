locals {
  kube_subnet_name    = "${var.cluster_name}-sn"
  appgw_subnet_name   = "${var.cluster_name}gw"

  subnet_structures = [
    {
      name     = local.kube_subnet_name
      new_bits = 4
    },
    {
      name     = local.appgw_subnet_name
      new_bits = 4
    },
  ]
}
