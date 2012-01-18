TARGET ?=
TESTS ?=
CC ?= g++

all: build

.PHONY: all build test

build: $(TARGET).cpp
	$(CC) -Wall -O2 -lm $(TARGET).cpp -o $(TARGET)

test: build
	mkdir -p test
	$(foreach i,$(TESTS),./$(TARGET) < $(TARGET).$(i).in > test/$(TARGET).$(i).out && diff $(TARGET).$(i).out test/$(TARGET).$(i).out)

clean:
	rm -rf test/ *.o $(TARGET)
