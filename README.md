# OpenPath Ansible
Ansible project to deploy [OpenPath](https://github.com/e-mission/e-mission-server)

# Launch
1. Install Ansible
``` shell
pip install -r requirements.txt
```

2. Set a `hosts.ini` file (see [hosts.example.ini](hosts.example.ini))
```
# hosts.ini
[openpath]
# Change 'example.com' with the address to the server.
# Change 'test@example.com' with the email address of the admin (used by certbot).
example.com certbot_email=test@example.com
```

3. Run Ansible
``` shell
ansible-playbook -i hosts.ini playbook.yml
```
See [Troubleshooting](#troubleshooting) in case of problem.

# Troubleshooting
## Error on `Install and setup Miniconda`
That task takes takes a lot of ressources and often crashes. If it happens:
1. Manually delete `~/miniconda-23.5.2`
```shell
rm ~/miniconda-23.5.2 -r
```
2. Setup manually
``` shell
cd ~/e-mission-server
source setup/setup_conda.sh Linux-x86_64
source setup/setup.sh
```
3. Run Ansible again.

If the task is still killed, then you'll have to increase the power of your server.
