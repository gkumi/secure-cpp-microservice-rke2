FROM gcc:latest
RUN apt-get update && \
    apt-get install -y libtinyxml2-dev libjsoncpp-dev
WORKDIR /app
COPY . /app
RUN make
ENTRYPOINT ["./microservice"]
