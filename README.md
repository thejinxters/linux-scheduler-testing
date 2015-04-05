#CS3753 (Operating Systems)
##Spring 2015
University of Colorado Boulder
Programming Assignment 3
Public Code

###---Running the tests---

The testscript has been built to make and run all the the tests

```bash
./testscript
```
Note: user/bin/time must be installed in order to run this program!


###---Executables---
```
./testscript - A simple bash script for running all the test cases
./pi - A simple program for statistically calculating pi
./rw - A simple i/o bound example program.
./pi-sched - A simple program for statistically calculating pi using
             a specific scheduling policy
./rw-sched - A simple program that reads and writes to an I/0 device using
             a specific scheduling policy
./pi-rw-sched - A simple program that combines the previous two programs
./driver - A program that forks processes to run multiple of the above programs
           at the same time with different scheduling processses
```


###---Examples---
Build:

```bash
 make
```

Clean:

```bash
 make clean
```

pi:

```bash
 ./pi
 ./pi <Number of Iterations>
```

rw:

```bash
 ./rw
 ./rw <#Bytes to Write to Output File>
 ./rw <#Bytes to Write to Output File> <Block Size>
 ./rw <#Bytes to Write to Output File> <Block Size> <Input Filename>
 ./rw <#Bytes to Write to Output File> <Block Size> <Input Filename> <Output Filename>
```

pi-sched, rw-sched, pi-rw-sched:

```bash
 ./pi-sched
 ./pi-sched <Scheduling Policy>
```

driver:

```bash
 ./driver <Program to Use> <Number of Processes> <Scheduling Policy>
```

testscript:

```bash
 ./testscript
```
