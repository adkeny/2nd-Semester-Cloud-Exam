# 2nd-Semester-Cloud-Exam  - AUTOMATING THE PPROVISION OF TWO (2) UBUNTU SERVERS, NAMELY MASTER-NODE AND SLAVE NODE; AUTOMATE THE INSTALLATION LAMP STACK ON MASTER NODE, AND RESUSE THE BASH SCRIPT TO INSTALL THE SAME ON SLAVE NODE BUT AUTOMATED USING ANSIBLE PLAYBOOK.

STEP 1: Provision of two ubuntu web servers namely master-node and slave-node is demonstrated in the image attached below:
![image](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/b81e8a7a-0773-45eb-a421-a70aa5aeeab2)

The above configurations, automates the spinning of two ubuntu machines and also automate the provisoion of LAMP stack on the master using an external bash script writing for this purpose


STEP 2: Using Ansible play book this time LAMP stack is deployed on the Slave node from the master with the aid of ansible technology: The following commands and output are represented in the images below:
![Vagrant up VMs -](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/b651fe77-5dbf-4a04-99fb-de2329bdf5f6)


STEP: 3 Repository fro Master-node Ubuntu machine being updated -
![updating Vms repos](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/9798a72a-7f96-4006-8baa-aaefed3b2ce5)



STEP 4: Update repository to install ansible
![updat repo to install ansible](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/7fc4ccb5-298c-4f65-9603-6690531e0eb3)


STEP 5: Establish and SSH Connection between the Master and Slave Ubuntu machinse (The Control and the Hosts), by first running the sSG Keygen Commmand:


STEP 6: Connecting manster node to slave using the command via IP address of node ssh 192.168.56.102 
![ssh connection](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/e7852f85-8b19-4e89-8f27-8e0771efa842)

Slave node suucessfuly ssh into; ![ssh into slave node to check](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/6940902d-84f7-4e3a-9775-e4254deec63d)

![ssh connection - successfully done](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/1b2404f2-0998-4afe-b91c-ad3783dd1275)

STEP 7: Installing ansible and its repositories 
-  A![installing ansible on control node](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/661c8ef0-a76b-4a6b-9cd1-736ad9c9553c)


checking for successful installation of ansible - ![checking if ansible is installed successfully](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/46524985-7eed-437f-ac2c-77fc09adc004)

change directory into ansible
- etc/ansible/ ![cd into ansible directory to touch a file call inventory](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/92c05c56-13e9-4be4-af3a-3cdc963daa8b)

create and auxilliary file in ansible home directory call inventory - to populate with IP address of targets hosts machine in ths case the Slave node
- ![cd into ansible directory to touch a file call inventory](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/3a211827-232e-4743-bb43-8baaa89ee79b)

Ping inventory 
- ![successfully ping ansible inventory created](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/59e7cdcc-a6fa-452e-a9b4-3d3dbc8b24a9)

TEst run play book 
![test run of ansible play book](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/a409c70b-35ed-49b0-adc7-b7aab5caea4a)

Final check on content of Myplaybook.yml before play
-![All require files are now in ansible  directory ready to run ansible](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/e234b15f-ce3a-43a1-b542-c49f75a60c1d)

playbook check Okay 
-![Playbook successfully tested and ok reachability of slave node](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/c6e4a105-8d7a-4bcf-be32-4cc23259053d)


Palybook successfuly executed on our targeted host - (Slave node VMs) installing and Deploping LAMP stack
-![Ansible Play successful and  deploy LAMP stack on Slave Node also susccessful](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/d1f79e1f-b7a9-48ff-8c03-2df1d140faa2)


THE IMAGES BELOW SHOW THE SUCCESSFUL DEPLOYMENT OF LAMPSTACK ON OUR SLAVE NODE
Apache2 Web Server installed activ and running on slave node
-![apache 2 installed](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/018e31e5-6ab9-4d20-b4b3-15ca346ca0f3)


MYSQL server successfully installed and slave node, active and running with Database name ALTSCHOOLDB created
:- ![mysql DB installed](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/ffc7c216-31ef-4972-b8f5-0c9c147da5d4)


plugs- called composer for installing PHP and other depenedencies fully install on slave node 
-:![composer fully installed](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/ce00ed27-690a-4882-98bb-755103e4f610)


All PHP modules installed and active on slave node:
-![PHP -modules installed](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/5d683dc7-dbdd-491b-9a86-b1afe312074e)


Laravel default web page accessible through slave-node localhost port 8081
- ![migration from PHP to Laravel Succesful - apache home default page access through Vms localhost on port 8081](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/31b89066-ff4e-4917-abb7-0f633665c798)


Laravel default page accessible through the slave node VM's IP adddress on 192.168.56.102 - ![Laravel default page accessible via VMs IP address](https://github.com/adkeny/2nd-Semester-Cloud-Exam/assets/146006688/ed13812d-1dc5-4b17-bee1-2fb12ca4138d)


