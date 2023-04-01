module "network" {
  source = "./modules/network"

  environment = var.environment
  tags        = var.tags
}
