# docker-ansible #

A simple docker container to run Ansible. Available in Docker Hub as j842/ansible and github as j842/docker-ansible.

In bin directory are a bunch of helper scripts. The ones needed are:

| Script               | Descrption | 
|----------------------|---------------------------------------------------------------------|
| install              | Add scripts to /usr/local/bin for accessing ansible. | 
| init                 | Initialise the Docker storage volume for the ansible settings       | 
| copykeys PATH        | Copy all files from PATH into /root/.ssh in the docker container.   |   
| setconfig CONFIGFILE | Set the ansible configuration file (/root/.ansible.cfg)             |  

Having completed the above you should be able to run ansible, ansible-playbook etc from the host.

The ansible config file defaults to:
```
[defaults]
host_key_checking = false
pipelining = true
```

By default no SSH keys are installed. Use copykeys to copy across suitable keys.
