# Development with Docker

```shell
docker build -t mroach.com .

docker run -it -v $PWD:/site:z -p 5000:4000 mroach.com
```
