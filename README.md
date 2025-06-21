git clone https://github.com/dhohirpradana/remote-android-web.git
cd remote-android-web
docker network create reverse-proxy

update .env file values
docker compose up --build -d