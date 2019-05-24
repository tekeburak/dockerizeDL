# Dockerize Deep Learning
- Ensure you have the NVIDIA drivers installed on your host system
- Running DL applications in docker containers

# First install docker and nvidia-docker2
```console
burak@docker:~$ chmod +x install.sh
burak@docker:~$ ./install.sh
```

## Build a Docker image for Ubuntu 18.04 (bionic) or 16.04 (xenial) from lambdal repository.
```console
burak@docker:~$ sudo docker build -t lambda-stack -f Dockerfile.$(lsb_release -cs) git://github.com/lambdal/lambda-stack-dockerfiles.git
```
## List docker image. You should see lambda-stack and latest.
```console
burak@docker:~$ sudo docker image list
```

## Run a command in docker image
```console
burak@docker:~$ sudo docker run --rm --interactive --tty --runtime=nvidia lambda-stack:latest /bin/bash
```

## Upload the docker image to a container registry
```console
burak@docker:~$ sudo docker login
burak@docker:~$ sudo docker tag lambda-stack myusername/reponame:tagname
burak@docker:~$ sudo docker push myusername/reponame:tagname
```

## Run your Docker container without having to re-build the image
```console
burak@docker:~$ sudo docker run --rm --interactive --tty myusername/reponame:tagname \
    /usr/bin/python3 -c \
    'import tensorflow as tf; s = tf.Session(); print("Mission completed!");'
```

## If you encounter a problem building a docker image, clean and build again
```console
burak@docker:~$ docker system prune --all --force --volumes
```

```
WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all volumes not used by at least one container
        - all images without at least one container associated to them
        - all build cache
```
# Source
[Set-up Docker and nvidia-docker](https://lambdalabs.com/blog/set-up-a-tensorflow-gpu-docker-container-using-lambda-stack-dockerfile/)

[Clean Docker images](https://medium.com/the-code-review/clean-out-your-docker-images-containers-and-volumes-with-single-commands-b8e38253c271)