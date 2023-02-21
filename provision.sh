#!/bin/bash
vagrant rsync
vagrant provision --provision-with ansible
