#!/bin/bash
export VAGRANT_EXPERIMENTAL="disks"
vagrant up
vagrant rsync
vagrant provision --provision-with ansible
