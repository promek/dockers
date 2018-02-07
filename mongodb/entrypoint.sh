#!/bin/sh

[ "$1" = "mongod" ] || exec "$@" || exit $?

: ${MNG_USER}
: ${MNG_PASS}

[ "$(stat -c %U /data/db)" = mongodb ] || chown -R mongodb /data/db

if ! [ -f /data/db/.setpwd ]; then

    eval su -s /bin/sh -c "mongod" mongodb &

    RET=1
    while [ $RET -ne 0 ]; do
        sleep 3
        mongo admin --eval "help" >/dev/null 2>&1
        RET=$?
    done

    mongo admin --eval "db.createUser({user: '$MNG_USER',pwd: '$MNG_PASS',roles: [{role: 'root', db: 'admin'}]})"

    echo "!!!DO NOT DELETE!!! promek/mongodb docker container" > /data/db/.setpwd

    mongod --shutdown
fi

cmd="$@"

exec su -s /bin/sh -c "$cmd -f /etc/mongod.conf" mongodb
