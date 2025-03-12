#!/bin/bash

# Run specific task
ansible-playbook httpdbytags.yml -t i-httpd
ansible-playbook httpdbytags.yml -t s-httpd

# List all tags in a playbook
ansible-playbook httpdbytags.yml --list-tags

# To skip a task using a tag
ansible-playbook httpdbytags.yml --skip-tags i-httpd
