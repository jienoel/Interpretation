install and config apache

`
tasks:
- name: install apache
action: yum name=httpd state=installed
- name: configure apache
copy: src=files/httpd.conf dest=/etc/httpd/conf/httpd.conf
`

-------------------------------------------------------------------
 ping module
ansible ping module to check the connectivity to our server tobe configured $ ansible site01 -u root -k -m ping

#This should ask for the SSH password and then produce a result that looks like the

`
following code:
site01 | success >> {
"changed": false,
"ping": "pong"
}
`

--------------------------------------------------------------------
remote_user
set the username globally, edit /etc/ansible/ansible.cfg and change the line that sets remote_user in the [defaults] section. You can also change remote_port to change the default port that Ansible will SSH to. 

 set the username in the inventory file
`
[webservers]
site01 ansible_ssh_user=root
site02 ansible_ssh_user=daniel
site01-dr ansible_ssh_host=site01.dr ansible_ssh_port=65422
[production]
site01
site02
db01 ansible_ssh_user=fred
ansible_ssh_private_key_file=/home/fred/.ssh.id_rsa bastion
`

--------------------------------------------------------------------
configure Ansible to obtain root access using sudo
The first step is to add a line to the /etc/sudoers file; this may already be set up if you choose to use your own account. You can use a password with sudo, or you can use a passwordless sudo. If you decide to use a password, you will need to use the -k argument to Ansible, or set the ask_sudo_pass value to true in /etc/ansible/ansible.cfg. To make Ansible use sudo, add --sudo to the command line.

--------------------------------------------------------------------
setup module
This module connects to the
configured node, gathers data about the system, and then returns those values. This
isn't particularly handy for us while running from the command line, however, in a
playbook you can use the gathered values later in other modules.

`$ ansible machinename -u root -k -m setup`

--------------------------------------------------------------------
run Ansible from the command line
To run Ansible from the command line, you need to pass two things, though usually
three. First is a host pattern to match the machine that you want to apply the module
to. Second you need to provide the name of the module that you wish to run and
optionally any arguments that you wish to give to the module. For the host pattern,
you can use a group name, a machine name, a glob, and a tilde (~), followed by a
regular expression matching hostnames, or to symbolize all of these, you can either
use the word all or simply *.


--------------------------------------------------------------------
file module
It allows us to actually configure the remote machine.
You can call the file module, as shown in the following command, to see details
about /etc/fstab:
`$ ansible machinename -u root -k -m file -a 'path=/etc/fstab'`
The preceding command should elicit a response like the following code:

`
machinename | success >> {
"changed": false,
"group": "root",
"mode": "0644",
"owner": "root",
"path": "/etc/fstab",
[ 11 ]
Getting Started with Ansible
"size": 779,
"state":
"file"
}
`

Or like the following command to create a new test directory in /tmp:
`$ ansible machinename -u root -k -m file -a 'path=/tmp/test state=directory mode=0700 owner=root'`
The preceding command should return something like the following code:

`
machinename | success >> {
"changed": true,
"group": "root",
"mode": "0700",
"owner": "root",
"path": "/tmp/test",
"size": 4096,
"state": "directory"
}
`

The second command will have the changed variable set to true, if the directory
doesn't exist or has different attributes. When run a second time, the value of
changed should be false indicating that no changes were required.





