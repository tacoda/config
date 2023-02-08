.PHONY: build
build:
	docker-compose build --no-cache

.PHONY: clean
clean:
	docker-compose down

.PHONY: up
up: build
	docker-compose up

.PHONY: start
start:
	docker-compose start

.PHONY: stop
stop:
	docker-compose stop

.PHONY: restart
restart:
	docker-compose restart

.PHONY: status
status:
	docker-compose ps

.PHONY: log
log:
	docker-compose logs -f

.PHONY: run
run:
	docker-compose run app $(cmd)

.PHONY: shell
shell:
	docker-compose run app bash

