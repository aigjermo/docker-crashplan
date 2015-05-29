# docker-crashplan

Crashplan service container

Credit to [Scott Hansen](https://github.com/firecat53/dockerfiles) for the legwork.
My changes are mostly about avoiding the init step after build, and using docker-compose to manage volumes.

## Configure

Make will create a default `docker-compose.yml` for you to extend if other backup target are needed etc.
The idea is to have crashplan back up anything located under `/mnt/targets/`, so any volumes added there would be backed up:

    service:
      volumes:
        - /home/user/Pictures:/mnt/targets/pictures
        - /home/user/Stuff:/mnt/targets/stuff

Incoming backups are stored in a new docker volume by default, but you may change it to a host folder if you like.


## Usage

Run with `docker compose up -d`. After a few seconds crashplan should be listening on ports 4242 and 4243 as if it were running locally. You can connect with regular crashplan desktop or this [sister image](https://github.com/aigjermo/docker-crashplan-desktop).
