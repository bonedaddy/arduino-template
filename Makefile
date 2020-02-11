ifeq ($(BOARD),)
BOARD := arduino:samd:mkr1000
endif

ifeq ($(PORT),)
PORT := /dev/ttyACM0
endif

.PHONY: build
build: compile-sketch upload-sketch

.PHONY: compile-sketch
compile-sketch:
	arduino-cli compile --fqbn  $(BOARD) src

.PHONY: upload-sketch
upload-sketch:
	arduino-cli upload -p $(PORT) --fqbn $(BOARD) src