FROM docker-registry.qualcomm.com/library/python:3.8
#FROM docker-registry.qualcomm.com/library/python:latest

WORKDIR /app

COPY . .
COPY ./.vscode/.env.dev ./.env.dev

# ENV SECRET_KEY=django-insecure-+t+)ge1hkpezhwz_v%(-vp!fyvnw5dxmvgi=w2qzl*da3%y*rj
# ENV DEBUG=TRUE 
# ENV ALLOWED_HOSTS=*
# ENV ClientSecret=my-client-secret-dev
# or docker run --name <container name to assign> --env-file .vscode/.env.dev | .test [ --detach ] <image name> 
# or docker compose up [ --build --detach ] where docker-compose.yml file has setting env_file:\n\t- .vscode/.env.dev 

RUN pip install -r requirements.txt

EXPOSE 8000

#CMD ["python3", "manage.py", "runserver" ] 
#CMD python3 manage.py runserver
CMD tail -f /dev/null
