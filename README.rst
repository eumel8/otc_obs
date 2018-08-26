otc_obs
=======

OTC role for Object Storage Service (OBS).
This role requires curl, libxml2-utils, and openssl installed.

Authentification will be done with environment variables (e.g. EC2...)
or ansible-vault file in 'vars/_secrets.yml' or 'vars/secrets.yml'.
Dependly on that ansible-playbook must be called with vault param.


Variables:
^^^^^^^^^^

+-------------------------+-----------------------------------------------------------+
| Name                    | Description                                               |
+=========================+===========================================================+
| EC2_ACCESS_KEY          | OBS access key                                            |
+-------------------------+-----------------------------------------------------------+
| EC2_SECRET_KEY          | OBS secret key                                            |
+-------------------------+-----------------------------------------------------------+
| EC2_URL                 | OBS URL (default https://obs.otc.t-systems.com)           |
+-------------------------+-----------------------------------------------------------+
| bucket                  | s3 bucket name                                            |
+-------------------------+-----------------------------------------------------------+
| object                  | data to upload                                            |
+-------------------------+-----------------------------------------------------------+

Functions:
^^^^^^^^^^

list OBS buckets::

    ansible-playbook s3.yml -e "localaction=list" --vault-password-file vars/vaultpass.txt

    ansible-playbook s3.yml -e "localaction=list"

create OBS bucket::

    ansible-playbook s3.yml -e "bucket=mybucket" -e "localaction=create"

delete OBS bucket::

    ansible-playbook s3.yml -e "bucket=mybucket" -e "localaction=delete"

upload files in OBS (VHD, ZVHD, VMDK, QCOW2 are supported for otc image service)::

    ansible-playbook s3.yml -e "bucket=mybucket" -e "object=xenial-server-cloudimg-amd64-disk1.vmdk" -e "localaction=upload"

delete OBS objects::

    ansible-playbook s3.yml -e "bucket=mybucket" -e "object=xenial-server-cloudimg-amd64-disk1.vmdk" -e "localaction=delete_object" 
