Prepare to start env:

    chmod +x setup-env.sh
    chmod +x teardown-env.sh

Start env:

    ./setup-env.sh

Stop env:

    ./teardown-env.sh

Running a command in container from host proof of concept:

    docker exec wordpress-instance /bin/bash -c 'cd /usr/src/wordpress && ls'

Jump into a machine:

    docker exec -it wordpress-instance bash

Inside WordPress machine, list plugins:

    wp plugin list --allow-root --path=/usr/src/wordpress

Inside WordPress machine, access MySQL database:

    mysql --host=mysql -pqwerqwer

Inside machine, see all environment variables, including ones created by Docker:

    printenv

Jump out of a machine:

    ctrl+p+q
