git clone https://github.com/gemmamunoz/dockercoins-1
cd dockercoins
docker network create dockercoins
docker login
docker build -t gemmamunoz/ruby:sinatra-thin hasher/
docker push gemmamunoz/ruby:sinatra-thin
docker run -d --entrypoint ruby --name hasher --read-only --restart always -u nobody -v $PWD/hasher/hasher.rb:/data/hasher.rb -w /data/ --network dockercoins gemmamunoz/ruby:sinatra-thin hasher.rb
docker pull redis:alpine
docker inspect redis:alpine
docker build -t gemmamunoz/redis:alpine redis/ 
docker push gemmamunoz/redis:alpine
docker run -d --entrypoint docker-entrypoint.sh --name redis --read-only --restart always -u redis -v redis:/data/ -w /data/ --network dockercoins gemmamunoz/redis:alpine redis-server
docker build -t gemmamunoz/python:flask rng/
docker push gemmamunoz/python:flask
docker run -d --entrypoint python --name rng --read-only --restart always -u nobody -v $PWD/rng/rng.py:/data/rng.py -w /data/ --network dockercoins gemmamunoz/python:flask rng.py
docker build -t gemmamunoz/python:redis-requests worker/
docker push gemmamunoz/python:redis-requests
docker run -d --entrypoint python --name worker --read-only --restart always -u nobody -v $PWD/worker/worker.py:/data/worker.py -w /data/ --network dockercoins gemmamunoz/python:redis-requests worker.py 
