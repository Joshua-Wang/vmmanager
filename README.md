# vmmanager
virtual machine management system
This system implements two functions:
1. a web portal for manage Eucalyptus VMS. 
2. a IAAS-level VM trading system.

System Architure : MVC(jquery+structs) + DAO(Hibernate) + mysql

This system implements user management for both ordinary users and system admins.

1. Ordinary users can apply get registered and apply for virtual machines(the CPUS,memory,disk can be configured during apply process).
System admins can authorize vms to ordinary users. The VMs are created through Eucalyptus, a IAAS-level platform.
After authorized , ordinary users can use VMs from remote terminals. 

2. through vmmanager, System admins can manage VMs from the website, such as (start, shutdown, reboot) , and get VMs reconfigured.
