module "dev_cluster" {
    source       = "./main"
    env_name     = "dev"
    cluster_name = "osmseed-cluster"
    num_cluster_nodes = "1"
    instance_type= "standard_d2_v2"
}

# module "prod_cluster" {
#     source       = "./main"
#     env_name     = "prod"
#     cluster_name = "osmseed-cluster"
#     num_cluster_nodes = "2"
#     instance_type= "standard_d11_v2"
# }