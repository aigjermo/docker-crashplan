# docker-crashplan

Crashplan service container

Credit to [Scott Hansen](https://github.com/firecat53/dockerfiles) for the legwork.
My changes are mostly about avoiding the init step after build, and using docker-compose to manage volumes.

Extend `docker-compose.yml` if other backup target are needed etc.
The idea is to have crashplan back up anything located under `/mnt/targets/`, so any volumes added there would be backed up.
