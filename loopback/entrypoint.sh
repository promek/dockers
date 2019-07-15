#!/bin/sh

[ "$1" = "pm2-runtime" ] || exec "$@" || exit $?

: ${LBC_MODS}

if ! [ -d /home/api ]; then

    cd /home
    tar -zxvf ../api.tar.gz
    cd api
    npm install
    
    for mdl in $(echo $LBC_MODS | tr "," "\n"); do
        npm install $mdl --save
    done

fi

cmd="$@"

exec su -s /bin/sh -c "$cmd /home/api"
