resource "digitalocean_firewall" "main_firewall" {
  name = "project-devops-firewall"

  droplet_ids = [
    digitalocean_droplet.jenkins.id,
    digitalocean_droplet.registry.id,
    digitalocean_droplet.app.id
  ]

  # SSH
  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0"]
  }

  # Jenkins
  inbound_rule {
    protocol         = "tcp"
    port_range       = "8080"
    source_addresses = ["0.0.0.0/0"]
  }

  # Registry
  inbound_rule {
    protocol         = "tcp"
    port_range       = "5000"
    source_addresses = ["0.0.0.0/0"]
  }

  # App 
  inbound_rule {
    protocol         = "tcp"
    port_range       = "8081"
    source_addresses = ["0.0.0.0/0"]
  }

  # Salida a internet 
  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0"]
  }
}