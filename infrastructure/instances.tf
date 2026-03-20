resource "digitalocean_droplet" "jenkins" {
  name   = "jenkins-droplet"
  region = "nyc3"
  size   = "s-2vcpu-2gb" 
  image  = "ubuntu-22-04-x64"

  user_data = file("${path.module}/scripts/user_data_jenkins.sh")
}

resource "digitalocean_droplet" "registry" {
  name   = "registry-droplet"
  region = "nyc3"
  size   = "s-1vcpu-1gb" 
  image  = "ubuntu-22-04-x64"

  user_data = file("${path.module}/scripts/user_data_registry.sh")
}

resource "digitalocean_droplet" "app" {
  name   = "app-droplet"
  region = "nyc3"
  size   = "s-1vcpu-1gb" 
  image  = "ubuntu-22-04-x64"

  user_data = file("${path.module}/scripts/user_data_app.sh")
}