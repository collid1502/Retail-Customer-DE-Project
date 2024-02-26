# dev container

Once a devconatiner & docker-compose had been built: 
open a VS Code editor at the location of `.devcontainer` so its the root dir. Assuming you have the correct remote-dev extension installed (and docker running via your CLI/machine) you can use `ctrl + shift + p` to open command palette and open folder in container. It will let you identify the folder that contains your devcontainer.json etc. and can open a remote connection. Once this has been done once, it should now also be available in the remote-explorer tab (like where SSH/tunnels are) are target : containers. By creating a terminal, you should see your docker based terminal open. You can now also do file > open folder > ... which will let you navigate the file structure within your docker container, to your mounted workspace, for example. Everything built / saved at that workspace (provided mounted to a local drive correctly) will auto-replicate to the local space so you do not lose any work, and it exists each time you work in your container, and it can be involved in source control for a larger project!

------------

- Inside your project directory, create a .devcontainer folder.
- Inside .devcontainer, create a devcontainer.json file. This file tells VS Code how to access your container. Here's an example configuration:

```
{
  "name": "My Remote Container",
  "dockerComposeFile": "../docker-compose.yml",
  "service": "myservice",
  "workspaceFolder": "/container-folder",
  "shutdownAction": "stopCompose"
}
```

- Adjust the paths and service names as per your docker-compose.yml. 

The "workspaceFolder": "/container-folder" setting in the devcontainer.json file for a VS Code Remote - Containers setup specifies the path within the Docker container that VS Code should use as the root of the workspace. This setting is important because it tells VS Code where to find your project files within the container.

Here's a bit more detail:

Purpose of workspaceFolder: When you open a project in a remote container using VS Code, the IDE needs to know where in the container's file system your code resides. The workspaceFolder setting in devcontainer.json provides this information.

How It Relates to Volumes: If you have configured a volume in your Docker setup (like in docker-compose.yml) to mount a local directory into the container, the workspaceFolder should usually correspond to the target path of that mount inside the container.

For example, if your docker-compose.yml has a volume definition like this:

```
volumes:
  - "./local-folder:/container-folder"
```

This mounts your local ./local-folder to /container-folder in the container. You should then set "workspaceFolder": "/container-folder" in devcontainer.json so that VS Code opens this directory as your workspace. 

Effect on VS Code: When you open the container in VS Code, it will use /container-folder as the root directory for your project. This means VS Code's explorer, terminal, and other features will be based in this directory, and it's where your code should be located for development.

By correctly setting the workspaceFolder, you ensure a seamless development experience, where VS Code is fully aligned with the structure of your Docker container. This allows you to edit, run, and debug your code as if it were running locally on your machine, while it's actually running inside the container.