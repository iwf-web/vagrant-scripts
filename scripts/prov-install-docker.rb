# -*- mode: ruby -*-
# vi: set ft=ruby :

def prov_install_docker(config)
    config.vm.provision "install-docker", type: "shell", privileged: false, inline: "sudo apt-get update && sudo apt-get upgrade -y docker-engine"
end
