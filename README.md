# Architecture
![Screenshot](./diagram/Architecture.png)

## Requirements
- 1 node ansible-controller RAM 2G
- 1 node master RAM 2G
- 2 node worker each node RAM 1.5G (total 3G)
- can are more node if you have resources :))
```
vagrant up # start VMs
vagrant halt # shutdown VMs
vagrant destroy # Destroy VMs
```
## Step-by-step setup cluster
- Install ansible and clone repo kubespray on ansible-controller
```
- Config inventory/mycluster/hosts.yaml after follow guide of kubespray before deploy cluster
all:
  hosts:
    master1:
      ansible_host: 192.168.10.10
      ip: 192.168.10.10
      access_ip: 192.168.10.10
    node1:
      ansible_host: 192.168.10.21
      ip: 192.168.10.21
      access_ip: 192.168.10.21
    node2:
      ansible_host: 192.168.10.22
      ip: 192.168.10.22
      access_ip: 192.168.10.22
  children:
    kube_control_plane:
      hosts:
        master1:
    kube_node:
      hosts:
        node1:
        node2:
    etcd:
      hosts:
        master1:
    k8s_cluster:
      children:
        kube_control_plane:
        kube_node:
    calico_rr:
      hosts: {}
```
https://mango-penguin-92f.notion.site/Quick-note-d952c51b03774b58aa715ecb8ed8cdac