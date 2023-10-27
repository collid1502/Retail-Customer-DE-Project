# Docker in local development

The use of docker in local development should ease the transition of moving an application to cloud, by using images to run on cloud hosted services etc.

## Docker Installation (Locally)

For this guide, docker will be installed in Linux, using an Ubuntu distribution on WSL. <br>
Docker Enginge (CE) Community Edition which is the free, open-source version will be installed. Start by updating the APT package index and installing required dependencies:

    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl software-properties-common

Then, add the Docker GPG key to your system:

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

now, add the Docker APT repository. You'll need to know which architecture you are on and choose the appropriate repository. This can be checked via the command line:

    dpkg --print-architecture

Which returns `**ARM64**` for my setup. As such, this will be the repo to choose. Add this by:

    echo "deb [arch=arm64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

Now, update APT package index again to include the new Docker repo:

    sudo apt update

At this point, I then refresh my terminal and begin the Docker installation:

    source ~/.bashrc
    sudo apt install docker-ce

Once this has indeed installed, we can enable Docker, start the service & run a quick version check:

    # enable 
    sudo systemctl enable docker

    # start Docker
    sudo service docker start 

    # this should return a message: `* Starting Docker: docker`
    # we can also check what version was installed:
    sudo docker --version

I have installed: `Docker version 24.0.7, build afdd53b` <br>

We can also check the status of Docker at any stage to see if it is already running, by:

    sudo service docker status 

    # and should we wish to stop it
    sudo service docker stop 

With Docker running, we can perform a quick smoke test of the "hello world" variety. By running:

    sudo docker run hello-world 

This command will download and run a test container to ensure Docker is functioning correctly after the installation steps above.

And assuming that returns a success message to the terminal, it's all set up to go!

----------------------

## Docker and Airflow

