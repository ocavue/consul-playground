run:
	docker-compose up --force-recreate
build:
	sh download-consul.sh
	docker image build -t consul-playground:latest .
	make run
clean:
	docker rm -f vm0 vm1 vm2 vm3
