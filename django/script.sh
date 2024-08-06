#!/bin/bash

sleep 10

python manage.py migrate

rm -rf /code/staticfiles/*
python manage.py collectstatic --noinput

exec gunicorn website.wsgi:application --bind 0.0.0.0:8000
