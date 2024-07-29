#!/bin/bash
# Michael O'Brien
# docker login -u username with token before running - to push

#TAG=0.0.1-ia64
TAG=0.0.1-arm

BUILD_ID=10001
BUILD_DIR=builds
mkdir ../../$BUILD_DIR
TARGET_DIR=../../$BUILD_DIR/$BUILD_ID
mkdir $TARGET_DIR
CONTAINER_IMAGE=biometric-go-nbi

#cd ../../
#mvn clean install -U -DskipTests=true
#cd src/docker

#cp ../../target/*.jar $TARGET_DIR
cp ../main.go $TARGET_DIR
cp ../go.mod $TARGET_DIR
cp ../go.sum $TARGET_DIR
cp Dockerfile $TARGET_DIR
#cp startService.sh $TARGET_DIR
# use following to generate credentials
# gcloud auth application-default login 
#cp ~/.config/gcloud/application_default_credentials.json $TARGET_DIR

cd $TARGET_DIR
docker build --no-cache --build-arg build-id=$BUILD_ID -t obrienlabs/$CONTAINER_IMAGE -f Dockerfile .
#docker tag $CONTAINER_IMAGE:latest $CONTAINER_IMAGE:latest
docker tag obrienlabs/$CONTAINER_IMAGE obrienlabs/$CONTAINER_IMAGE:$TAG
# dockerhub
docker push obrienlabs/$CONTAINER_IMAGE:$TAG


# locally
#CONTAINER_IMAGE2=biometric-nbi
docker stop $CONTAINER_IMAGE
docker rm $CONTAINER_IMAGE
#docker stop $CONTAINER_IMAGE2
#docker rm $CONTAINER_IMAGE2

#echo "starting: $CONTAINER_IMAGE"
#docker run --name $CONTAINER_IMAGE \
#    -d -p 8888:8080 \
#    -e os.environment.configuration.dir=/ \
#    -e os.environment.ecosystem=sbx \
#    obrienlabs/$CONTAINER_IMAGE:$TAG
##docker run --name $CONTAINER_IMAGE2 \
#    -d -p 8889:8080 \
#    -e os.environment.configuration.dir=/ \
#    -e os.environment.ecosystem=sbx \
#    obrienlabs/$CONTAINER_IMAGE:$TAG


cd ../../src/docker

#echo "http://127.0.0.1:8888/nbi/forward/packet?dnsFrom=host.docker.internal&dnsTo=host.docker.internal&from=8889&to=8888&delay=1000"
#echo "http://127.0.0.1:8888/nbi/forward/reset"
#echo "http://127.0.0.1:8889/nbi/forward/reset"

# mysql
# docker run --name mysql-dev0 -v mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD -d -p 3506:3306 arm64v8/mysql:8.0.38
 


#echo "export GOOGLE_APPLICATION_CREDENTIALS=~/.config/gcloud/application_default_credentials.json"
## --network="host"
#export GOOGLE_APPLICATION_CREDENTIALS=~/.config/gcloud/application_default_credentials.json
#echo "docker run -d -p 8888:8080 --name biometric-nbi -e GOOGLE_APPLICATION_CREDENTIALS=application_default_credentials.json obrienlabs/biometric-nbi:0.0.1-arm"
docker run -d -p 8888:8080 --name $CONTAINER_IMAGE obrienlabs/$CONTAINER_IMAGE:$TAG
echo "curl -X GET \"http://127.0.0.1:8888\" -H \"accept: */*\""
sleep 2

curl -X GET "http://127.0.0.1:8888" -H "accept: */*"

