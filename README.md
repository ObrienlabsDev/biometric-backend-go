# biometric-backend-go
biometric rest backend in Golang

# DevOps
- Dockerhub = https://hub.docker.com/repository/docker/obrienlabs/biometric-go-nbi/general
## Running the docker container webserver
See https://github.com/ObrienlabsDev/biometric-backend-go/blob/main/src/docker/build.sh#L72
```
docker run -d -p 8888:8080 --name $CONTAINER_IMAGE obrienlabs/$CONTAINER_IMAGE:$TAG
curl -X GET "http://127.0.0.1:8888" -H "accept: */*"
```
## Upgrade OSX go
Download latest (1.22.5) - https://go.dev/dl/

Remove go
```
note: module requires Go 1.23
michaelobrien@mbp7 10001 % go version
go version go1.17.8 darwin/amd64
michaelobrien@mbp7 10001 % which go
/usr/local/go/bin/go
michaelobrien@mbp7 10001 % sudo rm -rf /usr/local/go/bin
```
Install 
```
michaelobrien@mbp7 10001 % go version           
go version go1.22.5 darwin/arm64
```
# Links
- https://go.dev/doc/tutorial/web-service-gin
