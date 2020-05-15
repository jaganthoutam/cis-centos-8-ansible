# cis-centos-8-ansible

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
    RUNNING HANDLER [hardening : systemctl daemon-reload]           *************************************************************************************************

    RUNNING HANDLER [hardening : restart sshd] ************************************************************************************************************

    RUNNING HANDLER [hardening : yum clean] ***************************************************************************************************************
    PLAY RECAP     ********************************************************************************************************************
    192.168.10.74              : ok=58   changed=45   unreachable=0    failed=1    skipped=19   rescued=0    ignored=2
 ```
