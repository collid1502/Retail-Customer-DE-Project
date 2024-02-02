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