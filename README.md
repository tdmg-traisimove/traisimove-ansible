# TRAISI Move Ansible
Ansible project to deploy TRAISI Move's backend.

# Launch
**Note: This playbook has been tested only on Ubuntu.**

Beside step 1, all the steps must be done locally.

1. Copy your SSH key on the server.
See https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-20-04

2. Set up a virtual environment (recommended)
``` shell
python -m venv venv
source venv/bin/activate
```

3. Install Ansible
``` shell
pip install -r requirements.txt
```

4. Set up a `inventory.yaml` file (see [inventory-example.yaml](./inventory-example.yaml))
``` yaml
# inventory.yaml
traisimove:
  hosts:
    # Change 'example.com' with the address to the server.
    example.com:
      # Change 'test@example.com' with the email address of the admin (used by certbot).
      certbot_email: "test@example.com"
      # Change 'oracular' with the Ubuntu version codename, such as 'oracular' or 'focal'
      # 'oracular' (24.04) is the version on which the playbook has been tested.
      ubuntu_codename: "oracular"
      admin_dashboards:
        # Add as many studies as needed. Remove all the uneeded ones.
        # A study can be removed and reintroduced on any port without losing data.
        studies:
            # The study name must correspond to a study config
          - name: "test-study"
            # The port is arbitrary, as long as it is not already in use
            port: 6000
          - name: "test-study-2"
            port: 6001
        # In the current way of things, having different users for each study
        # would require to build a different Docker image for each study.
        users:
          # The users can be changed anytime
          - name: "name"
            password: "password"
          - name: "name2"
            password: "password2"
```

5. Run Ansible
``` shell
ansible-playbook -i inventory.yaml playbook.yml
```
See [Troubleshooting](#troubleshooting) in case of problem.

# Troubleshooting
## Error on `Install and setup Miniconda`
That task takes a lot of ressources and often crashes. If it happens:
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
