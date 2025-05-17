#sudo apt install openjdk-21-jre-headless-->You should need this
#Run Manually on Locally
# ./gradlew -->run this, if you don't have permision, then run below cmd
# chmod +x ./gradlew
#Run this on Server--> ./gradlew installDist
#ls -ltr
# Hence, there is an executable craeted --> ls -ltr ./build/install/opentelemetry-demo-ad/bin/Ad

#Now export AD_PORT=9099
# export FEATURE_FLAG_GRPC_SERVICE_ADDR=featureflagservice:50053
# Run this--> ./build/install/opentelemetry-demo-ad/bin/Ad
#means--> build is success, Ad service started listenning


# FROM eclipse-temurin:24-jdk AS builder
# WORKDIR /usr/src/app/

# COPY gradlew* settings.gradle* build.gradle ./
# COPY ./gradle ./gradle

# RUN chmod +x ./gradlew
# RUN .gradlew

# #downloading the dependencies
# RUN ./gradlew downloadRepos 

# COPY . .

# #u can give any name u want
# COPY ./pb ./proto   
# RUN chmod +x ./gradlew
# RUN ./gradlew installDist -PprotoSourceDir=./proto
# ENTRYPOINT ["./build/install/opentelemetry-demo-ad/bin/Ad"]



#We will create MULTI-STAGE Build

FROM eclipse-temurin:24-jdk AS builder
WORKDIR /usr/src/app/

COPY gradlew* settings.gradle* build.gradle ./
COPY ./gradle ./gradle

RUN chmod +x ./gradlew
RUN .gradlew

#downloading the dependencies
RUN ./gradlew downloadRepos 

COPY . .

#u can give any name u want
COPY ./pb ./proto   
RUN chmod +x ./gradlew
RUN ./gradlew installDist -PprotoSourceDir=./proto


#stage-2: Self container binary in GO, but java don't, We need install jre in JAVA
FROM eclipse-temurin:2-jre 
WORKDIR /usr/src/app/
COPY --from=builder /usr/src/app/ ./
ENV AD_PORT=9099
ENTRYPOINT ["./build/install/opentelemetry-demo-ad/bin/Ad"]


#Execute it: docker build -t kdprasad028/adservice:v1 .
#RUn: docker run kdprasad028/adservice:v1
