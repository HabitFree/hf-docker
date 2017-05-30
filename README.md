# hf-docker

## Basic Usage Instructions

1. Install [Docker](http://www.docker.com/).
2. Clone this repository to your local machine: `git clone https://github.com/HabitFree/hf-docker.git`
3. `cd` into your local copy.
4. Make shell files executable: `chmod +x *.sh`
5. Start the environment: `./restart-env.sh`
6. Load the site in a browser: [http://localhost:8080/](http://localhost:8080/)

## Logins

Account         | Username  | Password | Port
----------------|-----------|----------|-----
WordPress admin | admin     | hfpass   | 8080
DB: habitfree   | habitfree | hfpass   | 3305
DB: wp_test     | wp_test   | hftest   | 3306

## Commands

### Host Commands

Command                                                               | Description
----------------------------------------------------------------------|-------------------------
`chmod +x *.sh`                                                       | Prepare to start env
`./setup-env.sh`                                                      | Start env
`./teardown-env.sh`                                                   | Stop env
`mysql -h127.0.0.1 -P3306 -pqwerqwer -uroot`                          | Connect to test db
`docker exec hf-wordpress /bin/bash -c 'cd /usr/src/wordpress && ls'` | Run command in container
`docker exec -it hf-wordpress bash`                                   | Jump into machine

### Any Docker Machine Commands

Command              | Description
---------------------|-------------------------------------
`prentenv`           | See all env vars, including Docker's
`ctrl+p+q` or `exit` | Jump out of machine

### WordPress Docker Machine Commands

Command                                                 | Description
--------------------------------------------------------|----------------
`wp plugin list --allow-root --path=/usr/src/wordpress` | List plugins
`mysql --host=mysql -pqwerqwer`                         | Access MySQL db

    
