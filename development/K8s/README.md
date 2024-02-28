# Kubernetes Development via Minikube

Minikube allows us to locallay develop on our machine, rather than needing to spin up a cluster.<br>
See the **machine_setup** sub-dir for guidance on the install process.<br>

We can start minikube and run the K8s components directly on the host linux machine (in this case, a Cloud 9 EC2 machine), rather than in a VM.
```
sudo minikube start
```

***Note - not suitable for Production***

This should automatically choose the Docker driver (with root privs) <br>
You can then run a status check

```
minikube status
```

or stop the servivce with 

```
minikube stop
```

<br>

---------------------------
---------------------------

### holder 