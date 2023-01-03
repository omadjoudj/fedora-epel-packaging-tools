# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "fedora/37-cloud-base"
#  config.vm.box_version = "33.20201019.0"

  # config.vm.box_check_update = false

  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # config.vm.network "private_network", ip: "192.168.33.10"

  # config.vm.network "public_network"

  # config.vm.synced_folder "../data", "/vagrant_data"

  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
     vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
     vb.memory = "4000"
  end
  config.vm.provider "libvirt" do |kvm|
     kvm.memory = "4000"
     kvm.cpus = "1"
  end
  config.vm.provision "shell", inline: <<-SHELL
    # Prepare the VM
    dnf -y update
    dnf -y install fedora-packager fedora-review byobu vim-enhanced git bash-completion
    dnf install -y @c-development @development-tools @rpm-development-tools

    # Docker installation
    #dnf -y install dnf-plugins-core
    #dnf config-manager \
    #    --add-repo \
    #    https://download.docker.com/linux/fedora/docker-ce.repo
    #dnf install -y docker-ce docker-ce-cli containerd.io
    #systemctl start docker
    #systemctl enable docker

    # User creatation and repos setup
    #TODO: Shared the folder containing the ssh keys and clone the repos
    useradd -m athmane
    usermod -G mock,wheel athmane
    su - athmane sh -c "curl -s  -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    su - athmane sh -c "curl -s -o ~/.vimrc https://raw.githubusercontent.com/omadjoudj/dotfiles/master/.vimrc"
    echo 'athmane ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/athmane-nopasswd
    su - athmane sh -c "echo 'PATH=$PATH:/vagrant/' >> /home/athmane/.bashrc"
    #su - athmane sh -c "curl -s https://src.fedoraproject.org/user/athmane/projects | grep -o '>rpms/.*<' | tr -d '<>' | tee ~athmane/pkg_list"
    #su - athmane sh -c 'curl -s \'https://src.fedoraproject.org//api/0/projects?username=athmane&short=1\' | grep fullname | cut -d: -f2 | tr -d \'", \' | tee ~athmane/pkg_list'
  SHELL
end
