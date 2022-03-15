# dockercoins
```
git clone https://github.com/Bertbadi2022/dockercoins
cd dockercoins
docker build -t bertbadi2022/ruby:sinatra-thin hasher/
docker login
docker push bertbadi2022/ruby:sinatra-thin
docker network create dockercoins
docker run  --entrypoint ruby --name hasher --read-only --rm -u nobody -v $PWD/hasher/hasher.rb:/data/hasher.rb -w /data/ --network dockercoins bertbadi2022/ruby:sinatra-thin hasher.rb
