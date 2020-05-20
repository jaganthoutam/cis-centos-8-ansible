# cis-centos-8-Docker-ansible

  * inventory file Server IPAdds that you want to run OS Hardening Script 
    ```bash
    [hardening]
    192.168.10.74  #<========change the Server's IP Add that you want OS Hardening
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

#    Output Lynis security scan details:

```
================================================================================

  Lynis security scan details:

  Hardening index : 79 [###############     ]
  Tests performed : 268
  Plugins enabled : 2

  Components:
  - Firewall               [V]
  - Malware scanner        [V]

  Scan mode:
  Normal [V]  Forensics [ ]  Integration [ ]  Pentest [ ]

  Lynis modules:
  - Compliance status      [?]
  - Security audit         [V]
  - Vulnerability scan     [V]

  Files:
  - Test and debug information      : /var/log/lynis.log
  - Report data                     : /var/log/lynis-report.dat

================================================================================
```

# centos-cis-benchmark
Based on CIS CentOS Linux 7 Benchmark
v2.2.0 - 12-27-2017

## How to run the audit
To run the audit, execute these steps

```bash
git clone https://github.com/massyn/centos-cis-benchmark
cd centos-cis-benchmark
sudo bash run-cis-benchmark.sh
```
The following tests must be executed manually.  These are dependent on your own site configuration, and needs a manual check.  By default, the audit scripts will fail these checks.

* 1.2.1 - Ensure package manager repositories are configured (Not Scored)
* 3.4.2 - Ensure /etc/hosts.allow is configured (Scored)
* 3.4.3 - Ensure /etc/hosts.deny is configured (Scored)
* 3.6.4 - Ensure outbound and established connections are configured (Not Scored)
* 5.5 - Ensure root login is restricted to system console (Not Scored)

## Remediation
Some remediation scripts are also included, however use them at your own risk.  While most of the scripts would correct the problem, they could cause outages on your system, so be sure to have a proper roll back plan before you execute the scripts.




#Docker
```
git clone https://github.com/docker/docker-bench-security.git
cd docker-bench-security
sudo sh docker-bench-security.sh
```
