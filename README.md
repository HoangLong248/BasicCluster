# Architecture
![Screenshot](./diagram/Architecture.png)

## Requirements
- 1 node ansible-controller RAM 2G
- 1 node master RAM 2G
- 2 node worker each node RAM 1.5G (total 3G)
```
vagrant up # start VMs
vagrant halt # shutdown VMs
vagrant destroy # Destroy VMs
```
## Step-by-step setup cluster
- Install ansible and clone repo kubespray on ansible-controller