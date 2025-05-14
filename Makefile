CC = g++
CFLAGS = -std=c++17 -Wall -I/usr/include/nlohmann -I/usr/include
TARGET = microservice

all: $(TARGET)

$(TARGET): src/main.cpp
	$(CC) $(CFLAGS) -o $(TARGET) src/main.cpp -ltinyxml2

clean:
	rm -f $(TARGET)
