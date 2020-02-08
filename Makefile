init:
	cp .env.example .env
	docker-compose build
	docker-compose run --rm web bundle exec rails db:create db:migrate db:seed_fu
	docker-compose run --rm web bundle exec rails webpacker:compile
up:
	docker-compose up
down:
	docker-compose down
webpacker-compile:
	docker-compose exec web bundle exec rails webpacker:compile
