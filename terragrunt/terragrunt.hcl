include "root" {
  path = "provider.hcl"
}

terraform {
  source = "${get_repo_root()}/terraform//modules/common-cluster"
}


inputs = {
  resource_group_name                 = "sample-rg-k8s"
  create_resource_group               = true
  author                              = "sample-cluster"
  private_cluster_enabled             = "enable"
  location                            = "canadacentral"
  
  # Service Principal
  service_principal_name              = "sample-cluster"
  password_rotation_in_days           = 10
  tags = {
    Created_by = "redis_test_k8s_cluster"
  }
  # key vault
  key_vault_name                      = "sample-vault-k8s-1"
  # aks
  cluster_name                        = "sample-cluster-1"
  system_nodepool_name                = "system"
  system_nodepool_node_tier           = "Standard_D5_v2"
  system_nodepool_node_min_count      = 1
  system_nodepool_node_max_count      = 3
  user_nodepool1_name                 = "user"
  user_nodepool1_node_tier            = "Standard_D5_v2"
  user_nodepool1_node_min_count       = 1
  user_nodepool1_node_max_count       = 3
  admin_username                      = "sample"
  kubernetes_version                  = "1.27.7"


  # argocd
  config_path                         = "~/.kube/config"
  install_crds                        = true
  argo_helm_chart_version             = "5.55.0"
  argocd_apps_chart_version           = "1.6.0"
  argocd_rollout_chart_version        = "2.35.2"
  keep_crds                           = false
}