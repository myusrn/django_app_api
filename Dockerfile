# FROM python:3.8
# FROM python:latest
FROM docker-registry.qualcomm.com/library/python:3.8
# FROM docker-registry.qualcomm.com/library/python:latest

WORKDIR /app

COPY . .
# in cases where you need container deployment vscode debugging enabled
# COPY ./.vscode/.env.dev ./.env.dev
COPY ./.vscode ./.vscode

# ENV SECRET_KEY=django-insecure-+t+)ge1hkpezhwz_v%(-vp!fyvnw5dxmvgi=w2qzl*da3%y*rj
# ENV DEBUG=TRUE 
# ENV ALLOWED_HOSTS=*
# ENV ClientSecret=my-client-secret-dev
# or 'docker run --name <container name to assign> --env-file .vscode/.env.dev | .test [ --detach ] <image name>'
# or 'docker compose up ...' where docker-compose.yml file has setting env_file:\n\t- .vscode/.env.dev 

RUN pip install -r requirements.txt

# 'can you publish ports in dockerfile' -> have to use 'docker run -p|--publish <host port>:<container port> ...'
# or 'docker compose up ...' where docker-compose.yml file has setting ports:\n\t- <host port>:<container port>
# the following Dockerfile setting is for documentation purposes only
EXPOSE 8000

# 'docker run vs cmd vs entrypoint' -> https://geeksforgeeks.org/difference-between-run-vs-cmd-vs-entrypoint-docker-commands/

# possibly required for first runs of a django project in a container, we'll see
# RUN python manage.py migrate

#CMD python3 manage.py runserver
CMD tail -f /dev/null
