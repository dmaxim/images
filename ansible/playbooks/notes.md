
# Test Setup

````
mkdir playbooks
cd playbooks
vagrant init ubuntu/focal64
vagrant up
````

# SSH Config
````
vagrant ssh-config

ssh vagrant@127.0.0.1 -p 2222 -i .vagrant/machines/default/virtualbox/private_key

ansible testserver -i inventory/vagrant.ini -m ping

````

# Fix issue with mount.vboxsf

````
vagrant plugin install vagrant-vbguest
````

# Install Nginx

````
ansible testserver -b -m package -a name=nginx

ansible testserver -b -m service -a "name=nginx state=restarted"

````


# Clean Up
````
vagrant destroy -f
````


