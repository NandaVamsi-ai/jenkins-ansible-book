ls
ssh-keygen
ls -a
cd .ssh
ssh-copy-id devops@172.31.0.60
cd ..
ansible all -a"touch file1"
ansible all -a"ls"
su - root
sudo su
