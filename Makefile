CC = gcc
CFLAGS = -c -g -Wall -Wextra
LFLAGS = -g -Wall -Wextra

INPUTFILESIZEMEGABYTES = 1

KILO = 1024
MEGA = $(shell echo $(KILO)\*$(KILO) | bc)
INPUTFILESIZEBYTES = $(shell echo $(MEGA)\*$(INPUTFILESIZEMEGABYTES) | bc)
INPUTBLOCKSIZEBYTES = $(KILO)
INPUTBLOCKS = $(shell echo $(INPUTFILESIZEBYTES)\/$(INPUTBLOCKSIZEBYTES) | bc)

.PHONY: all clean

all: pi pi-sched rw rw-sched pi-rw-sched

pi: pi.o
	$(CC) $(LFLAGS) $^ -o $@ -lm

pi-sched: pi-sched.o
	$(CC) $(LFLAGS) $^ -o $@ -lm

rw: rw.o rwinput
	$(CC) $(LFLAGS) rw.o -o $@ -lm

rw-sched: rw-sched.o
	$(CC) $(LFLAGS) $^ -o $@ -lm

pi-rw-sched: pi-rw-sched.o
	$(CC) $(LFLAGS) $^ -o $@ -lm

pi.o: pi.c
	$(CC) $(CFLAGS) $<

pi-sched.o: pi-sched.c
	$(CC) $(CFLAGS) $<

rw.o: rw.c
	$(CC) $(CFLAGS) $<

rw-sched.o: rw-sched.c
	$(CC) $(CFLAGS) $<

pi-rw-sched.o: pi-rw-sched.c
	$(CC) $(CFLAGS) $<

rwinput: Makefile
	dd if=/dev/urandom of=./rwinput bs=$(INPUTBLOCKSIZEBYTES) count=$(INPUTBLOCKS)

clean: testclean
	rm -f pi pi-sched rw rw-sched pi-rw-sched
	rm -f rwinput
	rm -f *.o
	rm -f *~
	rm -f handout/*~
	rm -f handout/*.log
	rm -f handout/*.aux

testclean:
	rm -f rwoutput*
