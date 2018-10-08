# -*- mode: ruby -*-
# vi: set ft=ruby :

def apply_vm_settings(config, settings)

    config.vm.hostname = settings['hostname']

    if settings['ip'] == ""
        config.vm.network "private_network", type: "dhcp"
    else
        config.vm.network "private_network", ip: settings['ip']
    end

    config.vm.provider "virtualbox" do |v|
        if settings['vm_name']
            v.name = settings['vm_name']
        else
            v.name = settings['hostname']
        end
        if settings['vm_memory']
            v.memory = settings['vm_memory']
        end
        if settings['vm_cpus']
            v.cpus = settings['vm_cpus']
        end
    end

end
