CC ?= gcc
SRC := scr/main.c
BIN_DIR := bin
ALLEGRO_SOURCE_DIR := third_party/allegro4
BUILD_DIR := build/allegro4-x11-arm64

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
    CFLAGS += -O2 -Wall -Wextra $(shell test -x $(ALLEGRO_CONFIG) && $(ALLEGRO_CONFIG) --cflags)
    LDLIBS += $(shell test -x $(ALLEGRO_CONFIG) && $(ALLEGRO_CONFIG) --libs)
    LDFLAGS += -Wl,-rpath,$(ALLEGRO_DIR)/lib
    RUN_ENV := DYLD_LIBRARY_PATH=$(ALLEGRO_DIR)/lib
else
    TARGET := $(BIN_DIR)/allegro_test
    ALLEGRO_CONFIG ?= allegro-config
    CFLAGS += -O2 -Wall -Wextra $(shell $(ALLEGRO_CONFIG) --cflags)
    LDLIBS += $(shell $(ALLEGRO_CONFIG) --libs)
endif

.PHONY: all deps run clean

all: $(TARGET)

deps:

$(TARGET): $(SRC) | $(BIN_DIR)
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS) $(LDLIBS)

ifeq ($(PLATFORM),macos)
$(TARGET): $(ALLEGRO_CONFIG)
deps: $(ALLEGRO_CONFIG)

$(ALLEGRO_CONFIG): $(ALLEGRO_SOURCE_DIR)/CMakeLists.txt
	cmake -S $(ALLEGRO_SOURCE_DIR) -B $(BUILD_DIR) \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_OSX_ARCHITECTURES=arm64 \
		-DCMAKE_INSTALL_PREFIX=$(ALLEGRO_DIR) \
		-DCMAKE_PREFIX_PATH=/opt/homebrew \
		-DX11_INCLUDE_DIR=/opt/homebrew/include \
		-DX11_X11_LIB=/opt/homebrew/lib/libX11.dylib \
		-DX11_Xext_LIB=/opt/homebrew/lib/libXext.dylib \
		-DWANT_LEGACY_MACOSX=OFF \
		-DMAGIC_MAIN=OFF \
		-DWANT_EXAMPLES=OFF \
		-DWANT_TOOLS=OFF \
		-DWANT_TESTS=OFF \
		-DWANT_ALLEGROGL=OFF \
		-DWANT_LOADPNG=OFF \
		-DWANT_LOGG=OFF \
		-DWANT_JPGALLEG=OFF \
		-DWANT_FRAMEWORKS=OFF \
		-DWANT_MODULES=OFF \
		-DWANT_OSS=OFF \
		-DWANT_ALSA=OFF \
		-DWANT_JACK=OFF \
		-DWANT_SGIAUDIO=OFF
	cmake --build $(BUILD_DIR) --target install -j4
endif

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

run: $(TARGET)
	$(RUN_ENV) ./$(TARGET)

clean:
	rm -f $(BIN_DIR)/allegro_test $(BIN_DIR)/allegro_test.exe
