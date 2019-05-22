# Useful Docker commands

## Get the full ID of container. (sha256)
```console
~$ docker inspect --format="{{.Id}}" deeplearning:latest
```
## Accessing and modifying the container
### Where CONTAINER_ID is the ID given to you when you initially ran the container. (~$ docker ps)
```console
~$ sudo docker exec -it CONTAINER_ID bash
```
## Commit the changes
```console
~$ sudo docker commit CONTAINER_ID tekeburak/deeplearning:latest
```
## After committing, run the container and then run the following command to clean duplicate containers
```console
~$ docker system prune --all --force --volumes
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
~$ sudo docker run --rm --interactive --tty --runtime=nvidia tekeburak/deeplearning:latest /bin/bash
```
## Run docker container for jupyter notebook and link folders
```console
~$ docker run -p 8888:8888 -v ~/burak:/home/burak --rm --interactive --tty --runtime=nvidia tekeburak/deeplearning:latest /bin/bash
```
## Inside the docker, run this command to work with jupyter
```console
~$ jupyter lab --ip=0.0.0.0 --port=8888 --allow-root
```
## Copy file from local to docker (invoke inside docker env)
```console
~$ cp /home/burak/* "$PWD"/docker_folder
```