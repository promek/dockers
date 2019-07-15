#!/bin/sh

: ${GNC_BIND}
: ${GNC_WORKERS}


if ! [ -d /home/wsapp ] && [ -d /home/_install ]; then
    cd /home
    tar -zxvf /home/_install/src.tar.gz
    mv /home/src /home/wsapp
    cd /home/_install
    pip install -r requirements.txt
    cd /home/wsapp
    python manage.py collectstatic
    rm -rf /home/_install/
    cd /
fi

if [ -z $1 ]; then
    gunicorn --name wsapp \
            --workers $GNC_WORKERS \
            --bind $GNC_BIND \
            --config /home/gunicorn.cfg \
            --chdir /home/wsapp \
            mysite.wsgi:application
else
    $@
fi
