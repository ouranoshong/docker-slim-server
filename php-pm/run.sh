#!/bin/bash

/usr/bin/php /var/www/vendor/bin/ppm start \
    --bridge='App\Common\Bridges\Slim' \
    --debug=0 \
    --app-env=prod \
    --static-directory='/var/www/public' \
    --port=8000 \
    --host='0.0.0.0'
