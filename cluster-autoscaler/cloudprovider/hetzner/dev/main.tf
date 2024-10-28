module "dev" {
  source = "github.com/hetznercloud/kubernetes-dev-env?ref=v0.6.0" # x-release-please-version

  name         = "cas-${replace(var.name, "/[^a-zA-Z0-9-_]/", "-")}"
  hcloud_token = var.hcloud_token

  k3s_channel = var.k3s_channel
}
