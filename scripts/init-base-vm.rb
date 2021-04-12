# -*- mode: ruby -*-
# vi: set ft=ruby :

# see this issue: https://github.com/dotless-de/vagrant-vbguest/issues/351
class WorkaroundVbguest < VagrantVbguest::Installers::Linux
    def install(opts=nil, &block)
      puts 'Executing update workaround (system and kernel upgrade)...'
      communicate.sudo('apt-get -y --force-yes update', (opts || {}).merge(:error_check => false), &block)
      communicate.sudo('apt-get -y --force-yes upgrade', (opts || {}).merge(:error_check => false), &block)
      communicate.sudo('apt-get -y install build-essential linux-headers-amd64 linux-image-amd64', (opts || {}).merge(:error_check => false), &block)
      puts 'Continue vbguest installation...'
      super
      puts 'Perform vbguest post installation steps...'
      communicate.sudo('usermod -a -G vboxsf vagrant', (opts || {}).merge(:error_check => false), &block)
    end
    def reboot_after_install?(opts=nil, &block)
      true
    end
end

def init_base_vm(config)
    config.vm.box = "debian/contrib-stretch64"
    config.vm.box_check_update = false
    config.vbguest.installer = WorkaroundVbguest

    config.ssh.username = "vagrant"
end
