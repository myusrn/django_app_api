#!/bin/bash

#echo 'collect static files'
#python manage.py collectstatic --noinput

echo 'apply database migrations'
python manage.py migrate

echo 'create superuser'
python manage.py createadminuser

echo 'start server'
#python manage.py runserver # (default) expose on all interfaces ??? using port 8000
python manage.py runserver 0.0.0.0:8000 # explose on all interfaces using port 8000