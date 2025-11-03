# Define variables
SRC_DIR := src
BUILD_DIR := build
SUB_RESULTS := build/BLUEPILL/uf2boot.bin

.PHONY: all clean build copy message

all: build copy message

clean:
	@echo "Cleaning everything"
	rm -rf build/*
	make -C src clean
	make -C libopencm3 clean

build:
	@echo "Building project inside $(SRC_DIR)..."
	$(MAKE) -C $(SRC_DIR)

copy:
	@echo "Copying results to $(BUILD_DIR)..."
	mkdir -p $(BUILD_DIR)
	@for file in $(SUB_RESULTS); do \
		cp $(SRC_DIR)/$$file $(BUILD_DIR)/; \
	done

message:
	@echo "Successfuly built $(BUILD_DIR)/uf2boot.bin"

