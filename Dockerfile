# docker build . -t django-docker[:0.0.1] 
# docker run --name django_app_api-django-latest --env-file .vscode/.env.dev --publish 5678:5678 --publish 8000:8000 --detach django-docker[:0.0.1] # doesn't appear to work
# docker run --name django_app_api-django-latest --publish 5678:5678 --publish 8000:8000 --detach --volume ~/repos/django_app_api/.vscode/.env.dev:/app/.env django-docker[:0.0.1]

# docker build . -t docker-registry.qualcomm.com/obrien/django-docker
# docker run --name django_app_api-django-latest --publish 8000:8000 --detach --volume ~/repos/django_app_api/.vscode/.env.dev:/app/.env docker-registry.qualcomm.com/obrien/django-docker
# rancher k8s cluster=sddemo project=sandbox namespace=obrien-django-app-api deployment=obrien-django-app-api ingress-controller=obrien-django-app-api-ingress 
# hostname=https://obrien-django-app-api.sddemo.oks.drekar.qualcomm.com/

# FROM python:3.8
# FROM python:latest
FROM docker-registry.qualcomm.com/library/python:3.8
# FROM docker-registry.qualcomm.com/library/python:latest

WORKDIR /app

COPY . .

# this requires .vscode to be commented out in .dockerignore or use docker run --volume ~/repos/django_app_api/.vscode/.env.dev:/app/.env
# COPY ./.vscode/.env.dev ./.env
# RUN rm -rf .vscode

# ENV SECRET_KEY=django-insecure-+t+)ge1hkpezhwz_v%(-vp!fyvnw5dxmvgi=w2qzl*da3%y*rj
# ENV DEBUG=TRUE 
# ENV ALLOWED_HOSTS=*
# ENV ClientSecret=my-client-secret-dev
# or 'docker run --name <container name to assign> --env-file .vscode/.env.dev | .test [ --detach ] <image name>'
# or 'docker compose up ...' where docker-compose.yml file has setting env_file:\n\t- .vscode/.env.dev 

RUN pip install -r requirements.txt

# 'docker expose vs publish' -> e.g. https://baeldung.com/ops/docker/expose-vs-publish and 'can you publish ports in dockerfile' -> e.g. https://linuxhandbook.com/docker-expose-port/
# Exposing a port simply means letting others know on which port the containerized application is going to be listening on, or accepting connections on. This is for communicating with other 
# containers, not with the outside world.
# Publishing a port is more like mapping the ports of a container with ports of the host. This way, the container is able to communicate with external systems, the real world, the internet.
# to publish ports you have to use command line settings 'docker run -p|--publish <host port>:<container port> ...'
# or 'docker compose up ...' where docker-compose.yml file has setting ports:\n\t- <host port>:<container port>
# the following Dockerfile setting is for documentation purposes only
EXPOSE 5678
EXPOSE 8000

# 'docker run vs cmd vs entrypoint' -> https://geeksforgeeks.org/difference-between-run-vs-cmd-vs-entrypoint-docker-commands/

# possibly required for first runs of a django project in a container, we'll see
# RUN python manage.py migrate

# use following if you want to attach to container and debug starting django app yourself
#CMD python3 manage.py runserver
RUN chmod +x ./entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]
CMD [ "sh", "-c", "tail -f /dev/null" ]

