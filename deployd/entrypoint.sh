#!/bin/sh

[ "$1" = "pm2-runtime" ] || exec "$@" || exit $?

: ${DPD_MODS}
: ${MNG_HOST}
: ${MNG_PORT}
: ${MNG_DBNM}
: ${MNG_USER}
: ${MNG_PASS}

if ! [ -d /home/api ]; then

    cd /home
    dpd create api
    cd api

    echo "
var deployd = require('deployd');
var server = deployd({
  port: process.env.PORT || 2403,
  env: 'production',
  db: {
	host: '$MNG_HOST',
	port: $MNG_PORT,
	name: '$MNG_DBNM',
	credentials: {
	  username: '$MNG_USER',
	  password: '$MNG_PASS'
	}
  }
});
server.listen();
server.on('listening', function() {
  console.log('Server is listening');
});
server.on('error', function(err) {
  console.error(err);
  process.nextTick(function() {
	process.exit();
  });
});" > /home/api/server.js

    for mdl in $(echo $DPD_MODS | tr "," "\n"); do
        npm install $mdl --save
    done

    dpd keygen
    echo "Deployd Dashboard Key : "
    dpd showkey
fi

cmd="$@"

exec su -s /bin/sh -c "$cmd /home/api/server.js"
