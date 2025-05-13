CC = g++
CFLAGS = -std=c++17 -Wall
TARGET = microservice

all: $(TARGET)
$(TARGET): src/main.cpp
	$(CC) $(CFLAGS) -o $(TARGET) src/main.cpp -ltinyxml2 -ljson

clean:
	rm -f $(TARGET)
