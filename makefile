TARGET := kalmantest
DEBUG_FLAG := no

LIB_INSTALL_PATH := /usr/local/lib
INC_INSTALL_PATH := /usr/local/include

INCLUDE_DIR := -IAP_GenEKF/

# Define a variable for each type of files
SOURCES := $(wildcard */*.cpp)
SOURCES += $(wildcard *.cpp)
ALLSOURCES := $(SOURCES)
ALLSOURCES += $(wildcard *.h*)

# Define a variable for each command
CXX := g++
RM := rm -f

# Define conditional flags
WARNING_FLAGS := -Wall -W -Wfloat-equal -Winline -Wno-deprecated
ifeq ($(DEBUG_FLAG),yes)
  OTHER_FLAGS := -g
  INSTALL_FLAGS :=
else
  OTHER_FLAGS := -O3 -DNDEBUG
  INSTALL_FLAGS := -s
endif

CXXFLAGS := $(WARNING_FLAGS) $(OTHER_FLAGS) $(INCLUDE_DIR)


# Define main target
$(TARGET) : $(SOURCES)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Define some commands
.PHONY : clean

clean :
	$(RM) $(OBJECTS) $(TARGET)
