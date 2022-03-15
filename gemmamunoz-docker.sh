git clone https://github.com/gemmamunoz/dockercoins-1
cd dockercoins
docker network create dockercoins
docker login
docker build -t gemmadockerid/ruby:sinatra-thin hasher/
docker push gemmadockerid/ruby:sinatra-thin
docker run -d --entrypoint ruby --name hasher --read-only --restart always -u nobody -v $PWD/hasher/hasher.rb:/data/hasher.rb -w /data/ --network dockercoins gemmadockerid/ruby:sinatra-thin hasher.rb
docker pull redis:alpine
docker inspect redis:alpine
docker build -t gemmadockerid/redis:alpine redis/ 
docker push gemmadockerid/redis:alpine
docker run -d --entrypoint docker-entrypoint.sh --name redis --read-only --restart always -u redis -v redis:/data/ -w /data/ --network dockercoins gemmadockerid/redis:alpine redis-server
docker build -t gemmadockerid/python:flask rng/
docker push gemmadockerid/python:flask
docker run -d --entrypoint python --name rng --read-only --restart always -u nobody -v $PWD/rng/rng.py:/data/rng.py -w /data/ --network dockercoins gemmadockerid/python:flask rng.py
docker build -t gemmadockerid/python:redis-requests worker/
docker push gemmadockerid/python:redis-requests
docker run -d --entrypoint python --name worker --read-only --restart always -u nobody -v $PWD/worker/worker.py:/data/worker.py -w /data/ --network dockercoins gemmadockerid/python:redis-requests worker.py 
docker build -t gemmadockerid/node:4-slim webui/
docker push gemmadockerid/node:4-slim
