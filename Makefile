# Makefile for ftdi i2c driver

# use this version unless otherwise specified
ifeq ($(LIBFTDI), )
	LIBFTDI=libftdi1
endif

CFLAGS:=`pkg-config --cflags $(LIBFTDI)`
LIBS:=`pkg-config --libs $(LIBFTDI)`

.PHONY: clean

all: i2csend i2cget
clean:
	rm -f i2csend i2cget

i2csend: i2csend.c
	gcc $(CFLAGS) -o $@ $< $(LIBS)

i2cget: i2cget.c
	gcc $(CFLAGS) -o $@ $< $(LIBS)
