#-----------------------------------------------------------------------------
# Basic definitions
#		BASEDIR		where include, src, lib, ... are
#		INCDIR		include directory
#		LIBDIR		library directory
#		BINDIR		bin directory
#		LDFLAGS		loader flags
#		ANNLIBS		libraries
#-----------------------------------------------------------------------------

BASEDIR	= ..
INCDIR	= $(BASEDIR)/include
LIBDIR	= $(BASEDIR)/lib
BINDIR	= $(BASEDIR)/FNN
LDFLAGS	= -L$(LIBDIR)
ANNLIBS	= -lANN -lm

#-----------------------------------------------------------------------------
# Some more definitions
#		ANNSAMP		name of sample program
#-----------------------------------------------------------------------------

ANNSAMP = ann

SAMPSOURCES = ann.cpp
SAMPOBJECTS = $(SAMPSOURCES:.cpp=.o)

#-----------------------------------------------------------------------------
# Make the program
#-----------------------------------------------------------------------------

default: 
	@echo "Specify a target configuration"

targets: $(BINDIR)/$(ANNSAMP) $(BINDIR)/$

$(BINDIR)/$(ANNSAMP): $(SAMPOBJECTS) $(LIBDIR)/$(ANNLIB)
	$(C++) $(SAMPOBJECTS) -o $(ANNSAMP) $(LDFLAGS) $(ANNLIBS)

#-----------------------------------------------------------------------------
# configuration definitions
#-----------------------------------------------------------------------------

include ../Make-config

#-----------------------------------------------------------------------------
# Objects
#-----------------------------------------------------------------------------

ann.o: ann.cpp
	$(C++) -c -I$(INCDIR) $(CFLAGS) ann.cpp

#-----------------------------------------------------------------------------
# Cleaning
#-----------------------------------------------------------------------------

clean:
	-rm -f *.o *.out core

realclean: clean
