#!/bin/bash

### Migrations SH file should be in sync with Models of Django i-e Database 
### We cannot add this in DockerFile . Because when docker is created .We wont be having Database acees 
SUPERUSER_EMAIL=${DJANGO_SUPERUSER_EMAIL:-"hello@teamcfe.com"}
## app dir refers to same dir which is in DockerFile
cd /app/

/opt/venv/bin/python manage.py migrate --noinput

## After 1 time Script will fail if we dont write || true in below line
/opt/venv/bin/python manage.py createsuperuser --email $SUPERUSER_EMAIL --noinput || true