#/bin/bash

# Define
source ./define.sh

####################################
# user add
####################################
adduser -q --gecos "" --disabled-login ${USER_NAME}
echo "${USER_NAME}:${USER_NAME}" | chpasswd ${USER_NAME}
usermod -aG sudo ${USER_NAME}

####################################
# ssh config
####################################
sshd_config='/etc/ssh/sshd_config'
cp -a ${sshd_config}{,.`date '+%Y%m%d'`}
sed -i -e 's/#Port 22/Port 10240/g' ${sshd_config}
sed -i -e 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' ${sshd_config}
sed -i -e 's/#PasswordAuthentication yes/PasswordAuthentication no/g' ${sshd_config}

####################################
# authorized
####################################
su - ${USER_NAME}
ssh-keygen -t rsa -b 4096 -N "" -f /home/${USER_NAME}/.ssh/id_rsa
cat .ssh/id_rsa.pub >> .ssh/authorized_keys
chmod 600 .ssh/authorized_keys

#########################
# last
#########################
# id_rsa copy
/home/${USER_NAME}/.ssh/id_rsa ./
chmod 666 id_rsa

echo "end to setup_ssh."
echo "please setup to id_rsa."
