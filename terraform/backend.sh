#!/bin/bash
component=$1
environment=$2
AppVersion=$3
dnf install ansible -y
pip3 install botocore boto3

ansible-pull -i localhost, -U https://github.com/chandrajillellamudi/expense-ansible-config.git backend.yaml -e component=$component -e AppVersion=$AppVersion -c local
