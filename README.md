
git clone https://github.com/dhohirpradana/remote-android-web.git
cd remote-android-web

(update .env file values)

curl -s https://install.zerotier.com | sudo bash
sudo zerotier-cli join <network-id>
docker network create reverse-proxy
docker compose up --build -d

published port are 8000 & 5000