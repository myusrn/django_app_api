# FROM python:3.8
# FROM python:latest
FROM docker-registry.qualcomm.com/library/python:3.8
# FROM docker-registry.qualcomm.com/library/python:latest

WORKDIR /app

COPY . .
# COPY ./.vscode ./.vscode
# COPY ./.vscode/.env.dev ./.env.dev

# ENV SECRET_KEY=django-insecure-+t+)ge1hkpezhwz_v%(-vp!fyvnw5dxmvgi=w2qzl*da3%y*rj
# ENV DEBUG=TRUE 
# ENV ALLOWED_HOSTS=*
# ENV ClientSecret=my-client-secret-dev
# or 'docker run --name <container name to assign> --env-file .vscode/.env.dev | .test [ --detach ] <image name>'
# or 'docker compose up ...' where docker-compose.yml file has setting env_file:\n\t- .vscode/.env.dev 

RUN pip install -r requirements.txt

# 'docker expose vs publish' -> e.g. https://www.baeldung.com/ops/docker/expose-vs-publish and 'can you publish ports in dockerfile' -> e.g. https://linuxhandbook.com/docker-expose-port/
# Exposing a port simply means letting others know on which port the containerized application is going to be listening on, or accepting connections on. This is for communicating with other 
# containers, not with the outside world.
# Publishing a port is more like mapping the ports of a container with ports of the host. This way, the container is able to communicate with external systems, the real world, the internet.
# to publish ports you have to use command line settings 'docker run -p|--publish <host port>:<container port> ...'
# or 'docker compose up ...' where docker-compose.yml file has setting ports:\n\t- <host port>:<container port>
# the following Dockerfile setting is for documentation purposes only
EXPOSE 8000

# 'docker run vs cmd vs entrypoint' -> https://geeksforgeeks.org/difference-between-run-vs-cmd-vs-entrypoint-docker-commands/

# possibly required for first runs of a django project in a container, we'll see
# RUN python manage.py migrate

# use following if you want to attach to container and debug starting django app yourself
#CMD tail -f /dev/null
CMD python3 manage.py runserver
