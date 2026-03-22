CC ?= gcc
SRC := scr/main.c
BIN_DIR := bin

UNAME_S := $(shell uname -s 2>/dev/null)

ifeq ($(OS),Windows_NT)
    PLATFORM := windows
else ifeq ($(UNAME_S),Darwin)
    PLATFORM := macos
else
    PLATFORM := linux
endif

ifeq ($(PLATFORM),windows)
    TARGET := $(BIN_DIR)/allegro_test.exe
    ALLEGRO_CONFIG ?= allegro-config
    CFLAGS += -O2 -Wall -Wextra $(shell $(ALLEGRO_CONFIG) --cflags)
    LDLIBS += $(shell $(ALLEGRO_CONFIG) --libs)
else ifeq ($(PLATFORM),macos)
    TARGET := $(BIN_DIR)/allegro_test
    ALLEGRO_DIR := $(abspath ./lib/allegro4)
    ALLEGRO_CONFIG := $(ALLEGRO_DIR)/bin/allegro-config
    CFLAGS += -O2 -Wall -Wextra $(shell $(ALLEGRO_CONFIG) --cflags)
    LDLIBS += $(shell $(ALLEGRO_CONFIG) --libs)
    LDFLAGS += -Wl,-rpath,$(ALLEGRO_DIR)/lib
    RUN_ENV := DYLD_LIBRARY_PATH=$(ALLEGRO_DIR)/lib
else
    TARGET := $(BIN_DIR)/allegro_test
    ALLEGRO_CONFIG ?= allegro-config
    CFLAGS += -O2 -Wall -Wextra $(shell $(ALLEGRO_CONFIG) --cflags)
    LDLIBS += $(shell $(ALLEGRO_CONFIG) --libs)
endif

.PHONY: all run clean

all: $(TARGET)

$(TARGET): $(SRC) | $(BIN_DIR)
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS) $(LDLIBS)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

run: $(TARGET)
	$(RUN_ENV) ./$(TARGET)

clean:
	rm -f $(BIN_DIR)/allegro_test $(BIN_DIR)/allegro_test.exe
