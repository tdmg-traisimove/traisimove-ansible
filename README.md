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
example.com # Change with the address to the server
```

3. Run
``` shell
ansible-playbook -i hosts.ini playbook.yml
```
