# -*- mode: ruby -*-
# vi: set ft=ruby :

def init_base_vm(config)
    config.vm.box = "debian/contrib-stretch64"
    config.vm.box_check_update = false

    config.ssh.username = "vagrant"
end
