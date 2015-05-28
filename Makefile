service: Dockerfile crashplan-install.sh start.sh .data
	docker build -t crashplan_service .

data_volume: .data

.data:
	docker create -v /opt/crashplan/conf -v /srv/crashplan/backups --name crashplan_data tianon/true > .data

.PHONY: service, data_volume
