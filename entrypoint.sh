#!/bin/bash

# echo 'collect static files'
# python manage.py collectstatic --noinput

# echo 'make database migrations'
# python manage.py makemigrations

echo 'apply database migrations'
python manage.py migrate

# echo 'create superuser'
# python manage.py createsuperuser --username django --email django@domain.com --<missing switch for password> SomeHardToGuessPassphrase

echo 'start server'
python manage.py runserver # (default) expose on all interfaces using port 8000
#python manage.py runserver 172.31.93.229:8000 # expose on specific interface using port 8080
#python -m debugpy --listen 5678 manage.py runserver # with python debugger attach listener enabled alternative to manage.py enabled and waiting for attach
