all: frontend dashboard

frontend:
	docker-compose run elm elm-make src/Timetable/Frontend/Main.elm --output assets/js/app-main.js

dashboard:
	docker-compose run elm elm-make src/Timetable/Dashboard/Main.elm --output assets/js/app-dashboard.js