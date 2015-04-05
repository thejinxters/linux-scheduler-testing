#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>

#define MAXARGLENGTH 80

int main(int argc, char* argv[]){

	// Argv1 = program to run
	// Argv2 = number of processes to fork
	// Argv3 = Scheduler

	if (argc != 4){
		exit(1);
	}

	// Fork Processes!
	int i;
	int j;
	int status;
	for(i = 0; i < atol(argv[2]); i++){
		if(fork() == 0){
			execve(argv[1], &argv[3], NULL);
		}
	}
	for(j = 0; j < atol(argv[2]); j++){
		waitpid(0, &status, 0);
	}

	return 0;
}
