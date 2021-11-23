# -*- mode: ruby -*-
# vi: set ft=ruby :

class DockerUsername
    def to_s
        print "Please enter your Docker credentials (the same as for dockerhub.com)\n"
        print "Username: "
        STDIN.gets.chomp
    end
end

class DockerPassword
    def to_s
        begin
        system 'stty -echo'
        print "Password: "
        map = {'"' => '%22', '#' => '%23', '^' => '25%5E' }
        re = Regexp.new(map.keys.map { |x| Regexp.escape(x) }.join('|'))
        pass = STDIN.gets.chomp.gsub(re, map)
        ensure
        system 'stty echo'
        end
        pass
    end
end

def prov_docker_login(config)
    config.vm.provision "docker-login", type: "shell", privileged: false, env: {"USERNAME" => DockerUsername.new, "PASSWORD" => DockerPassword.new}, inline: <<-SHELL
            /usr/bin/docker login -u $USERNAME -p $PASSWORD
SHELL
end
