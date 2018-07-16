# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative 'init-base-vm.rb'
require_relative 'vagrant-plugins-check-and-config.rb'
require_relative 'init-shared-folder.rb'
require_relative 'apply-vm-settings.rb'
require_relative 'prov-docker-login.rb'
require_relative 'prov-copy-ssh-key.rb'
require_relative 'prov-install-docker.rb'
require_relative 'prov-install-php-proxy.rb'
require_relative 'prov-create-app-data-folders.rb'
require_relative 'prov-run-docker-local-build.rb'
require_relative 'prov-local-boot-scripts.rb'
require_relative 'prov-fix-app-data-permissions.rb'

def init_all(config, settings)
    init_base_vm(config)
    vagrant_plugins_config(config)
    apply_vm_settings(config, settings)
    init_shared_folder(config, settings)

    prov_copy_ssh_key(config)
    prov_docker_login(config)

    prov_install_docker(config)
    prov_install_php_proxy(config)
    prov_create_app_data_folders(config)
    prov_run_docker_local_build(config)

    prov_fix_app_data_permissions(config)
    prov_local_boot_scripts(config)

    config.vm.post_up_message = "Machine was booted. The application is available on http://" + settings['hostname']
end
