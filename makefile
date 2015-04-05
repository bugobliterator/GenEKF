TARGET := kalmantest
DEBUG_FLAG := no

INCLUDE_DIR := -I`pwd`

# Define a variable for each type of files
SOURCES := $(wildcard */*.cpp)
ALLSOURCES := $(SOURCES)
ALLSOURCES += $(wildcard */*.h*)
ALLFILES := $(ALLSOURCES) makefile
OBJECTS := $(SOURCES:.cpp=.o)

# Define a variable for each command
CXX := g++
AR := ar
RM := rm -f
TAR := tar czf
UNIX2DOS := unix2dos
DOS2UNIX := dos2unix
UPDATE := cvs update
COMMIT := cvs commit
INSTALL := install

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
$(TARGET) : %.o
	$(CXX) -r $@ $^

# Define some rules
%.o : $(ALLSOURCES)
	$(CXX) -c $(CXXFLAGS) -o $@ $< 


# Define some commands
.PHONY : clean toDos toUnix cvs archive install doc develdoc samples

clean :
	$(RM) $(OBJECTS) $(TARGET) *~ kalman/*~


# Define dependencies
kstatics.o : $(ALLSOURCES)
