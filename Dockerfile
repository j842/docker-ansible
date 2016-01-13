# Ansible in a Docker container, accessed via ssh.

FROM phusion/baseimage
MAINTAINER j842

RUN apt-get update && apt-get install -y apt-transport-https software-properties-common python-apt python-pycurl python-httplib2 
RUN apt-get install -y build-essential libssl-dev libffi-dev python-dev python-pip git

RUN pip install ansible cryptography

RUN rm -f /etc/service/sshd/down
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

RUN rm -rf /root/.ssh
RUN ln -s /root/.ssh /sshkeys
RUN ln -s /root/ansible /data

RUN grep -q '^export EDITOR' /root/.bashrc && sed -i 's/^export EDITOR.*/export EDITOR=nano/' /root/.bashrc || echo 'export EDITOR=nano' >> /root/.bashrc
#ADD ["./assets","/"]

VOLUME ["/sshkeys","/data","/root/.ansible.cfg"]
EXPOSE 22
CMD ["/sbin/my_init"]
