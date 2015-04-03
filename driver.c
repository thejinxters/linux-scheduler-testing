
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

main(int argc, char* argv[]){

	// Argv1 = program to run
	// Argv2 = number of processes to fork
	// Argv3 = Scheduler 

	//TODO: Check arguments for the program!

	// Fork Processes!
	for(i = 0; i < atol(argv[2]); i++){
		if(fork() == 0){
			execve(argv[1], argv[3], NULL);
		}
	}
	for(j = 0; j < atol(argv[2]); j++){
		waitpid(0, &status, 0);
	}
}