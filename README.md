# Snare Tanner Dockerized Container
---

### Why?
- Easy to deploy
- Sandboxed (Honeypot)
- Can prevent (most of the) errors 

### How to Install?
- Install Docker First
- Then use the following commands (Linux/UNIX)

```
git clone https://github.com/aatharvauti/SnareTanner-Docker.git
cd SnareTanner-Docker

sudo docker-compose build
sudo docker-compose up -d
```

Then execute the following command on the host machine

```
sudo docker exec <CONTAINERID> snare --port 80 --page-dir sakec-admin.netlify.com --tanner 0.0.0.0 --host-ip 0.0.0.0
```

It should be up and running

#### For interacting with the shell,
```
sudo docker container ls
sudo docker attach <CONTAINER ID>
```

To exit out of container without killing the container,
Ctrl Q + Ctrl P




