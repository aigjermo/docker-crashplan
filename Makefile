service: Dockerfile crashplan-install.sh start.sh docker-compose.yml .data
	docker build -t crashplan_service .

data_volume: .data

.data:
	docker create -v /opt/crashplan/conf -v /srv/crashplan/backups --name crashplan_data tianon/true > .data

docker-compose.yml: .compose-defaults.yml
	@[ ! -f docker-compose.yml ] \
		&& cp .compose-defaults.yml docker-compose.yml \
		&& echo copied default config to docker-compose.yml \
		|| echo docker-compose.yml exists, remove it if you would like to go back to defaults

.PHONY: service, data_volume
