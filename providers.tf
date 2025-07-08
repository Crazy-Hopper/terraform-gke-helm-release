provider google {
  project = var.google_project
  region  = var.google_region
}

data google_client_config default {}

provider kubernetes {
  host                   = "https://${var.cluster_endpoint}"
  cluster_ca_certificate = var.cluster_ca_certificate
  token                  = data.google_client_config.default.access_token
}

provider helm {
  kubernetes = {
    host                   = "https://${var.cluster_endpoint}"
    cluster_ca_certificate = var.cluster_ca_certificate
    token                  = data.google_client_config.default.access_token
  }
}
