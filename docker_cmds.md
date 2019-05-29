# Useful Docker commands

## Get the full ID of container. (sha256)
```console
burak@ubuntu:~$ docker inspect --format="{{.Id}}" deeplearning:latest
```
## Accessing and modifying the container
### Where CONTAINER_ID is the ID given to you when you initially ran the container. (~$ docker ps)
```console
burak@ubuntu:~$ sudo docker exec -it CONTAINER_ID bash
```
## Commit the changes
```console
burak@ubuntu:~$ sudo docker commit CONTAINER_ID tekeburak/deeplearning:latest
```
## After committing, run the container and then run the following command to clean duplicate containers
```console
burak@ubuntu:~$ docker system prune --all --force --volumes
```

```
WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all volumes not used by at least one container
        - all images without at least one container associated to them
        - all build cache
```
## Run docker container with nvidia-docker
```console
burak@ubuntu:~$ sudo docker run --rm --interactive --tty --runtime=nvidia tekeburak/deeplearning:latest /bin/bash
```
## Run docker for non-root user
### Before running, the following steps should be completed in docker root user.
```console
root:~# apt install sudo
root:~# adduser sammy
root:~# usermod -aG sudo sammy
```
### Open another terminal commit the changes (docker ps to get CONTAINER_ID)
```console
burak@ubuntu:~$ docker commit CONTAINER_ID tekeburak/deeplearning:latest
```
### Finally run docker for non-root user
```console
burak@ubuntu:~$ docker run --user=burakteke -w=/home/burakteke -v /home/burak/burak_docker:/home/burakteke -p 8888:8888 --rm --interactive --tty --runtime=nvidia tekeburak/deeplearning:latest /bin/bash
```
## Run docker container for jupyter notebook and link folders
```console
burak@ubuntu:~$ docker run -p 8888:8888 -v ~/burak:/home/burak --rm --interactive --tty --runtime=nvidia tekeburak/deeplearning:latest /bin/bash
```
## Inside the docker, run this command to work with jupyter
```console
burak@ubuntu:~$ jupyter lab --ip=0.0.0.0 --port=8888 --allow-root
```
## Copy file from local to docker (invoke inside docker env)
```console
burak@ubuntu:~$ cp /home/burak/* "$PWD"/docker_folder
```
## In order to able to run docker commands without sudo
```console
burak@ubuntu:~$ sudo groupadd docker
```
```console
burak@ubuntu:~$ sudo usermod -aG docker $USER
```