provider "aws" {
  region = var.region
}

# --- Network Module ---
module "network" {
  source              = "./modules/network"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
}

# --- Compute Module ---
module "compute" {
  source         = "./modules/compute"
  vpc_id         = module.network.vpc_id
  public_subnet  = module.network.public_subnet_id
  private_subnet = module.network.private_subnet_id
  key_name       = "doug-test-key"
}

# --- Load Balancer Module ---
module "lb" {
  source        = "./modules/lb"
  vpc_id        = module.network.vpc_id
  public_subnet = module.network.public_subnet_id
  sg_id         = module.compute.public_sg_id
  target_id     = module.compute.public_instance_id
}

# --- Storage Module ---
module "storage" {
  source      = "./modules/storage"
  bucket_name = "doug-test-2025"
}
