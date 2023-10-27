# Learning and discussions about OSCAR

## What is Oscar?

Oscar is a serverless platform developed by GryCap group (https://github.com/grycap). Although it uses a serverless paradigm, as I have read, I think in it like a 'server' in which I update some scripts and, when I update an input (for example, some images), it gives me an output (using buckets in MinIO). It is based in Kubernetes, and it uses some apps for local testing, like Docker for nodes, Kubectl for communicating with Kubernetes clusters, Helm for development and Kind. 

You can use OSCAR in different ways: locally (you have to use the four apps mentioned), with IM Dashboard, with EC3, with Helm and on K3s with Ansible. I try the last one

## Instalation. Deployment on K3s with Ansible

We can configure OSCAR with other IoT computers or virtual machines if we follow this steps

1- Clone the repository and move into ansible folder:
```
git clone https://github.com/grycap/oscar.git
cd oscar/deploy/ansible
```

2- SSH configuration: Using ``nano ~/.ssh/config``, write:

```
Host front
  HostName 10.42.1.215    
  User ubuntu
  IdentityFile ~/.ssh/my_private_key

Host wn1
  Hostname 10.42.1.215
  User ubuntu
  IdentifyFile ~/.ssh/my_private_key
  ProxyJump front
```
In this example, a host uses a public IP for making a proxy service with SSH, and the rest of nodes work internally (like master-slave paradigm I guess). In <PUBLIC_KEY> write the external server IP (OSCAR) and in <PRIVATE_KEY> an IP of my local network. Learning about it, I only have one node with a local IP (``ip a``), so I have two hosts with the same IP: front and wn1.

3- Edit 'hosts' file, using the next scheme:
```
[front]
front

[wn]
wn1
```
In [front] we write the only node who is going to make a proxy service, and in [wn] we write the rest of nodes.

4- Set up some variables. In ``vars.yaml``, write:
```
---
kube_version: v1.22.3+k3s1
kube_admin_token: kube-token123
oscar_password: Alvarooscar1.
dns_host: oscar-cluster.example.com
minio_password: Alvarominio1.
minio_dns_host: minio.oscar-cluster.example.com
minio_dns_host_console: minio-console.oscar-cluster.example.com
```

5- Run next command:
```ansible-galaxy install -r install_roles.yaml --force```

6- Run the playbook:
```ansible-playbook -i hosts oscar-k3s.yaml```
with the previous command, we run the playbook for OSCAR, using nodes specificated in ``hosts`` file

## Instalation. Deployment on Helm
Firstly, you must install [k9s](https://github.com/derailed/k9s), [KIND](https://kind.sigs.k8s.io/) (you need Docker previously installed), [kubectl](https://kubernetes.io/es/docs/tasks/tools/)

and ``kind get nodes`` returns
``
kind-control-plane
kind-worker2
kind-worker
``
as you set up in ``oscar.yaml``
