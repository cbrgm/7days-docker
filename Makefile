build: 
	docker build --tag "7daysserver:latest" .

run:
	docker run -itd --name "7days-docker" -p 26900-26902:26900-26902/udp -p 18500:8080 7daysserver:latest

start:
	docker start 7days-docker

stop:
	docker stop 7days-docker

backup:
	docker cp 7days-docker:/root/.local/share/7DaysToDie/Saves .

logs:
	docker cp 7days-docker:/home/steam/server/output.log .
	cat output.log
	rm -rf output.log
