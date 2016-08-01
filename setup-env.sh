#!/bin/bash

docker build -t habitfree/hf-wp-docker .


if [ ! -d "wp-accountability" ]; then
  git clone https://github.com/HabitFree/wp-accountability.git
fi

if [ ! -d "wp-hf-theme" ]; then
  git clone https://github.com/HabitFree/wp-hf-theme.git
fi

docker run --name some-mysql -v `pwd`/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=qwerqwer -e MYSQL_DATABASE=habitfree -e MYSQL_USER=habitfree -e MYSQL_PASSWORD=hfpass -p 3306:3306 -d mysql
docker run --name wordpress-instance --link some-mysql:mysql -v `pwd`/wp-accountability:/usr/src/wordpress/wp-content/plugins/wp-accountability -v `pwd`/wp-hf-theme:/usr/src/wordpress/wp-content/themes/wp-hf-theme -p 8080:80 -d habitfree/hf-wp-docker

until nc -z localhost 3306; do
    echo "$(date) - waiting for mysql..."
    sleep 1
done

docker ps

echo 'Configure WordPress'
NEXT_WAIT_TIME=0
MAX_WAIT_TIME=15
until docker exec wordpress-instance /bin/bash -c 'cd /usr/src/wordpress && wp core config --allow-root --dbname=habitfree --dbuser=habitfree --dbpass=hfpass --dbhost=mysql' || [ $NEXT_WAIT_TIME -eq $MAX_WAIT_TIME ]; do
    docker start wordpress-instance
    sleep $(( NEXT_WAIT_TIME++ ))
done

echo 'Install WordPress'
docker exec wordpress-instance /bin/bash -c 'cd /usr/src/wordpress && wp core install --allow-root --url=http://localhost:8080 --title=HabitFree --admin_user=admin --admin_password=hfpass --admin_email=info@habitfree.org --skip-email'
echo 'Activate Plugins'
docker exec wordpress-instance /bin/bash -c 'cd /usr/src/wordpress && wp plugin activate disable-canonical-redirects wp-accountability --allow-root --path=/usr/src/wordpress'
