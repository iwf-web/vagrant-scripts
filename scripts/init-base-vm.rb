# -*- mode: ruby -*-
# vi: set ft=ruby :

def init_base_vm(config)
    config.vm.box = "williamyeh/debian-jessie64-docker"
    config.vm.box_check_update = false

    config.ssh.username = "vagrant"
    config.ssh.password = "vagrant"
end
