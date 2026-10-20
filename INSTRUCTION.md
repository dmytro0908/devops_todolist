# Django ToDo App - Docker Instructions

## 📦 Docker Hub Repository
* Link: [https://hub.docker.com/r/dmytro0908_dockerhub/todoapp](https://hub.docker.com/r/dmytro0908_dockerhub/todoapp)

## 🛠️ Building the Image
To build the Docker image locally, run the following command in the root directory of the project:
```bash
docker build --build-arg PYTHON_VERSION=3.10 -t todoapp .