# cis-centos-8-Docker-ansible

  * inventory file Server IPAdds that you want to run OS Hardening Script 
    ```bash
    [hardening]
    192.168.10.74
    ```
    
    
    
  * Run Playbook
    ```bash
    ansible-playbook -i inventory hardening.yml -b --user=root
    ----
    ----
    ----
    RUNNING HANDLER [hardening : systemctl daemon-reload]     *************************************************************************************************

    RUNNING HANDLER [hardening : restart sshd] ************************************************************************************************************

    RUNNING HANDLER [hardening : yum clean] ***************************************************************************************************************
    PLAY RECAP
    ********************************************************************************************************************
    192.168.10.74              : ok=58   changed=45   unreachable=0    failed=1    skipped=19   rescued=0    ignored=2
 ```


# Test CIS Score 
Copy Below scrpit to root folder  in Server

```bash
vim checkscore.sh

#!/bin/sh
if command -v yum; then
  PKG="yum"

sudo "$PKG" -y update
sudo "$PKG" -y install git

git clone https://github.com/CISOFy/lynis

sudo chown -R root:root lynis
sudo chmod a+rx lynis
cd lynis || exit 1

LANG=C sudo ./lynis audit system
sudo cp '/var/log/lynis-report.dat' ~/
echo "ansible_version=$(ansible --version | grep '^ansible')" >> ~/lynis-report.dat

```




