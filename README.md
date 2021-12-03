# Trabalho 1 - Infraestrutura de TI

## Aplicação

Aplicação simples com uma imagem ubuntu que retorna um html com a mensagem ˜Hello World˜.

## Dockerfile

```
FROM ubuntu
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata 
RUN apt-get install -y \
    apache2 \
 && rm -rf /var/lib/apt/lists/*
COPY ./index.html /var/www/html/
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
```

## Geração da imagem

```
ubuntu@ip-172-31-82-19:~$ docker build -t nathanoschelski/t1infra-hello-world .
Sending build context to Docker daemon  18.94kB
Step 1/7 : FROM ubuntu
 ---> ba6acccedd29
Step 2/7 : RUN apt-get update
 ---> Using cache
 ---> dd8ec60c2ba3
Step 3/7 : RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
 ---> Using cache
 ---> b4abf0c0ad5b
Step 4/7 : RUN apt-get install -y     apache2  && rm -rf /var/lib/apt/lists/*
 ---> Using cache
 ---> 29c325545942
Step 5/7 : COPY ./index.html /var/www/html/
 ---> Using cache
 ---> 169e8f8a684a
Step 6/7 : EXPOSE 80
 ---> Using cache
 ---> dc14968fb6a7
Step 7/7 : CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
 ---> Using cache
 ---> 9bfb1744ce5a
Successfully built 9bfb1744ce5a
Successfully tagged nathanoschelski/t1infra-hello-world:latest
```

## Executando a imagem

```
ubuntu@ip-172-31-82-19:~$ docker run -t -d -p 80:80 nathanoschelski/t1infra-hello-world
c7bc0405ca2185b1babb7f1e8513209c4243fd768cb96c2d7018d6ee33404822

ubuntu@ip-172-31-82-19:~$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED             STATUS             PORTS                               NAMES
c01cc0021842   t1infra   "/usr/sbin/apache2ct…"   About an hour ago   Up About an hour   0.0.0.0:80->80/tcp, :::80->80/tcp   cool_brahmagupta
```
## Validando a imagem

```
ubuntu@ip-172-31-82-19:~$ curl http://localhost
<h1>Nathan Kruger Oschelski - Hello World</h1>
```


