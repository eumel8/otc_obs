#!/bin/sh

echo "SCENARIO 1: create OBS bucket"
ansible-playbook test.yml -e "bucket=ansible-test02 localaction=create" || exit 1
echo "SCENARIO 2: list OBS buckets"
ansible-playbook test.yml -e "localaction=list" || exit 1
echo "SCENARIO 3: upload OBS bucket"
ansible-playbook test.yml -e "bucket=ansible-test02 object=test.sh localaction=upload" || exit 1
echo "SCENARIO 4: delete OBS object"
ansible-playbook test.yml -e "bucket=ansible-test02 object=test.sh localaction=delete_object" || exit 1
echo "SCENARIO 5: delete OBS bucket"
ansible-playbook test.yml -e "bucket=ansible-test02 localaction=delete" || exit 1
