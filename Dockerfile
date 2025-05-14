FROM gcc:latest

# Install required libraries
RUN apt-get update && \
    apt-get install -y libtinyxml2-dev libjsoncpp-dev curl

# Create the directory for nlohmann headers
RUN mkdir -p /usr/include/nlohmann

# Download nlohmann/json single header file
RUN curl -L -o /usr/include/nlohmann/json.hpp https://github.com/nlohmann/json/releases/download/v3.11.2/json.hpp

# Set the working directory
WORKDIR /app

# Copy the entire project into the container
COPY secure-cpp-microservice-rke2 ./secure-cpp-microservice-rke2

# Compile the microservice
RUN g++ -o microservice ./secure-cpp-microservice-rke2/src/main.cpp -I/usr/include/nlohmann -I/usr/include -ltinyxml2

# Set the entry point to run the microservice
ENTRYPOINT ["./microservice"]
