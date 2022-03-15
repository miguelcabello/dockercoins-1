# dockercoins
```
git clone https://github.com/miguelcabello/dockercoins-1
cd dockercoins
docker network create dockercoins
docker login
docker build -t miguelcabello/ruby:sinatra-thin hasher/
docker push miguelcabello/ruby:sinatra-thin
docker run  --entrypoint ruby --name hasher --read-only --rm -u nobody -v $PWD/hasher/hasher.rb:/data/hasher.rb -w /data/ --network dockercoins miguelcabello/ruby:sinatra-thin hasher.rb
docker pull redis:alpine
docker inspect redis:alpine
docker build -t miguelcabello/redis:alpine redis/ 
docker push miguelcabello/redis:alpine
docker run  --entrypoint docker-entrypoint.sh --name redis --read-only --rm -u redis -w /data/ --network dockercoins miguelcabello/redis:alpine redis-server
docker build -t miguelcabello/python:flask rng/
docker push miguelcabello/python:flask
docker run  --entrypoint python --name rng --read-only --rm -u nobody -v $PWD/rng/rng.py:/data/rng.py -w /data/ --network dockercoins miguelcabello/python:flask rng.py
docker build -t miguelcabello/python:redis-requests worker/
docker push miguelcabello/python:redis-requests
docker run --entrypoint python --name worker --read-only --rm -u nobody -v $PWD/worker/worker.py:/data/worker.py -w /data/ --network dockercoins miguelcabello/python:redis-requests worker.py 
```
