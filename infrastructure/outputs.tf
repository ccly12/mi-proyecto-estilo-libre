output "jenkins_ip" {
  value = digitalocean_droplet.jenkins.ipv4_address
}

output "registry_ip" {
  value = digitalocean_droplet.registry.ipv4_address
}

output "app_ip" {
  value = digitalocean_droplet.app.ipv4_address
}