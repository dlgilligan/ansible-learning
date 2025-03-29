#!/bin/bash

ansible all -m group -a "name=automation state=present" -u SUDOER -b -k
ansible all -m user -a "name=automation \
	state=present \
	group=automation \
	groups=wheel \
	append=yes" -u SUDOER -b -k
ansible all -m file -a "path=/home/automation/.ssh \
	state=directory \
	owner=automation \
	group=automation \
	mode=0700" -u SUDOER -b -k
ansible all -m lineinfile -a "path=/home/automation/.ssh/authorized_keys \
	owner=automation \
	group=automation \
	mode=0600 \
	create=yes \
	line=" -u SUDOER -b -k
ansible all -m lineinfile -a "path=/etc/sudoers \
	regexp='^%wheel ALL=(ALL)' \
	line='%wheel ALL=(ALL) NOPASSWD: ALL' \
	validate='/usr/sbin/visduo -c'" -u SUDOER -b -k
