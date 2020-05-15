# cis-centos-8-ansible

  * inventory file Server IPAdds that you want to run OS Hardening Script 
    ```bash
    [hardening]
     192.168.10.74
    ```
    
    
    
  * Run Playbook
    ```bash
    ansible-playbook -i inventory hardening.yml -b --user=root
    ```
