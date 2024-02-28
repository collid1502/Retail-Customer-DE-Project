# you can check the filesystem with 
df -h 

# to check which directories are using the most space, you can use:
du -sh /home/ec2-user/*

# modify the EBS volume size on the AWS cloud console for the EC2 instance to 100GiB 
# Once that's done, come back and reboot the instance 
sudo reboot 

# once rebooted (can take a few minutes), check the root file system & it should now be 100G
# aka: /dev/nv... 
df --human-readable 

# also on Linux, you can make the display path shortened so that the whole breadcrum isnt shown 
nano ~/.bashrc # once file is opened, add:
# PROMPT_DIRTRIM=2  
# then ctrl+o, ctrl+x to save & exit file 
# then refresh terminal
source ~/.bashrc 

#======================================================================================================

# this script can install required software on the AWS Linux machine backing Cloud 9 EC2 instance 
sudo yum update -y # update package manager 

# =====================================================================================================
# Install Docker to build images, run containers etc. 
sudo yum install -y docker

# start docker & enable it at boot 
sudo systemctl start docker 
sudo systemctl enable docker 

# check docker status 
sudo service docker status # followed by ctrl+c to exit

# verify installation is working fine 
sudo docker run hello-world 

# enable the ec2-user to use docker without sudo 
sudo usermod -aG docker ec2-user 

# apply group changes immediately 
newgrp docker 

# or, stop docker by 
sudo systemctl stop docker

# then restart it 
sudo systemctl start docker 

# and try a command without sudo 
systemctl status docker 
docker run hello-world # should be all working as expected!!!

# =====================================================================================================
# Let's install miniconda so that we can create virtual python environments from this EC2 machine
# download installer file (not this will download it to your current folder location)
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

# create temp folder, copy the installer there
cd ~
mkdir temp
chmod +x temp # grant execution rights

# copy it to temp and then execute 
cp ~/work/retailCustomer_DE_Project/Miniconda3-latest-Linux-x86_64.sh ~/temp/
cd ~/temp
ls # you should now see the Miniconda execution installer there 
chmod +x ./Miniconda3-latest-Linux-x86_64.sh

# execute 
./Miniconda3-latest-Linux-x86_64.sh # click enter where needed in terminal & yes to confirm installation & location etc.

# run source ~/.bashrc for changes to take effect 
# you should now see that the (base) conda environment is activated automatically 

# remove the conda installer file 
rm ~/work/retailCustomer_DE_Project/Miniconda3-latest-Linux-x86_64.sh
rm ~/temp/Miniconda3-latest-Linux-x86_64.sh 

# Let's create a new environment (hit 'y' when prompted) 
conda create --name dmc311 python=3.11 jupyterlab pandas requests

# activate once it has been created 
conda activate dmc311
conda install pip # ensures the pip package is installed 

# use pip to add some extra packages not on conda, but from PYPI instead 
pip install duckdb polars pyyaml

# in order to install the psycopg2 package, which can be a client API for postgres / redshift etc.
# we must first install development packages pg_config 
sudo yum install postgresql-devel python-devel

# you can now run this package install to conda 
pip install psycopg2

# other package installs 
pip install faker datetime 

#==============================================================================================
# modify the .bashrc script to auto-default to this environment when starting
nano ~/.bashrc

## once open, add the line:
# conda activate dmc311
## to bottom of file, then save & exit. Restart the shell to test 

# =============================================================================================
## ================================= Installing Minikube ====================================== 
# a way to develop Kubernetes (K8s) locally with One Machine, rather than a cluster
cd ~
cd temp

sudo yum update -y # undertakes any updates required before installation 

# ================================== Install conntrack 
# This is required for minikube in managing connection tracking entries in the Linux kernel's netfilter framework. 
# It's essential for network-related functionalities within Kubernetes.
sudo yum install conntrack-tools -y
# check it's installed
conntrack --version 

# ================================== Install crictl
# This is for CLI interaction with container runtimes in K8s
VERSION="v1.22.0" # Replace this with the latest version
wget https://github.com/kubernetes-sigs/cri-tools/releases/download/${VERSION}/crictl-${VERSION}-linux-amd64.tar.gz
tar zxvf crictl-${VERSION}-linux-amd64.tar.gz
# Once crictl has been extracted, move it to a system wide location, aka: /usr/local/bin/ 
sudo mv crictl /usr/local/bin/crictl
# ensure the binary is executable 
sudo chmod +x /usr/local/bin/crictl
# you can now test it's available 
crictl --version 
# then remove the zipped download from temp
rm crictl-v1.22.0-linux-amd64.tar.gz 


# ================================== Install cri-dockerd
# cri-dockerd is an adapter that allows Docker to be used as a container runtime by Kubernetes through the CRI.
# NOTE - Docker must first be installed, as per above in this script 
# Install Go if it's not installed & dev tools 
sudo yum install -y go
sudo yum groupinstall "Development Tools"

# Clone the cri-dockerd repository
git clone https://github.com/Mirantis/cri-dockerd.git
cd cri-dockerd

# Build cri-dockerd
make cri-dockerd

# Move the binary to your PATH
sudo mv cri-dockerd /usr/local/bin

# test it installed ok 
cd ~
cri-dockerd --version

# go back & remove from temp (with force & recursive) 
cd temp
rm -f -r cri-dockerd


# ================================== Install Kubectl
# this is the command line tool for K8s
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# you can run `kuvectl version` to ensure it installed correctly 
# wipe kubectl file from temp folder 
rm kubectl 

# ================================== Install Minikube itself
# download from the releases page
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
ls
# make the file executable 
chmod +x minikube 
# move the minikube executable to /usr/local/bin/
# associates with the system's PATH variable 
sudo mv minikube /usr/local/bin/

# test it by running 
minikube --help
minikube version # Should return the version & show that the executable is now available 


# end of script 