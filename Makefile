RACK_DIR ?= ../Rack-SDK

FLAGS +=
CFLAGS +=
CXXFLAGS +=
LDFLAGS +=

SOURCES += $(wildcard src/*.cpp)

DISTRIBUTABLES += res README.md LICENSE.txt NOTICE.txt CHANGELOG.md

include $(RACK_DIR)/plugin.mk
