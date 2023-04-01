#!/bin/bash
vagrant up
vagrant rsync
vagrant provision --provision-with ansible
