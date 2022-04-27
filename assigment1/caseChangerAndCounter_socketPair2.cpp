
 /*-------------------------------------------------------------------------*
 *---									---*
 *---		caseChangerAndCounter_socketPair.cpp			---*
 *---									---*
 *---	    This file defines a 3-process application where:		---*
 *---	(*) The parent process creates 2 child processes, and then	---*
 *---	    open()s the files whose paths are on the command line	---*
 *---	    (for example, "foo.txt").  It sends the contents of each	---*
 *---	    file to the second child via a socket pair, and receives	---*
 *---	    from the same socket pair the same number of bytes, AND	---*
 *---	    an integer.  It write()s the same number of bytes to a new	---*
 *---	    file ("foo.txt.converted", in our example), and write()s	---*
 *---	    the integer to the first child via a pipe.			---*
 *---	(*) The second child process obtains buffers of bytes from	---*
 *---	    a socket pair, it then changes all uppercase ASCII chars	---*
 *---	    to lowercase, and all lowercase ASCII chars to uppercase.	---*
 *---	    It counts how many chars it converts.  It write()s the	---*
 *---	    converted buffer back to the socket pair, followed by the	---*
 *---	    integer count of the number of converted chars.		---*
 *---	(*) The first child process receives integers from the parent	---*
 *---	    via a pipe.  It sums all the integer.  When there are no	---*
 *---	    more integers it outputs the sum.				---*
 *---									---*
 *---	----	----	----	----	----	----	----	----	---*
 *---									---*
 *---	Version 1a		2022 April 8		Joseph Phillips	---*
 *---									---*
 *-------------------------------------------------------------------------*/

//  Compile with:
//  $ g++ caseChangerAndCounter_socketPair.cpp -o assign1 -g

#include	<stdio.h>
#include	<stdlib.h>
#include	<string.h>	// memset()
#include	<ctype.h>	// toupper(), isupper(), tolower(), islower()
#include	<sys/types.h>	// open(), creat()
#include	<sys/stat.h>	// open(), creat()
#include	<fcntl.h>	// open(), creat()
#include	<sys/socket.h>	// socketpair()
#include	<unistd.h>	// fork()
#include	<errno.h>	// perror()
#include	<wait.h>	// wait()

#define		NEW_EXTENSION	".converted"

const int	BUFFER_LEN	= 4096;


//  PURPOSE:  To read() buffers full of bytes from file-descriptor 'fd';
//	convert all uppercase ASCII chars to lowercase, and all lowercase
//	ASCII chars to uppercase; to count the total number of chars
//	converted in the buffer; and to write() the converted buffer and
//	the integer count back to 'fd'.  Returns 'EXIT_SUCCESS' when there
//	is nothing else to read().
int		doConverter	(int	fd
				)
{
  int	numChars;
  char	buffer[BUFFER_LEN];
  char*	run;
  char*	endCPtr;
  int	numConvertedChars;

  //  YOUR CODE HERE
  int x;

  //  YOUR CODE HERE
  while ((numChars = read(fd, buffer, BUFFER_LEN)) > 0) {
	  for (x = 0; x < numChars; x++)
		  if (islower(buffer[x]))
		  {
			  buffer[x] = toupper(buffer[x]);
			  numConvertedChars++;
		  }

		  else {
			  buffer[x] = tolower(buffer[x]);
			  numConvertedChars++;
		  }
	  write(fd, buffer, numChars);
	  write(fd, &numConvertedChars, size_t(numConvertedChars));
  }

  
  return(EXIT_SUCCESS);
}


//  PURPOSE:  To read() integers from 'inFd' and to sum those integers.
//	Prints sum when there are no integers, and returns 'EXIT_SUCCESS'.
int		doSummer	(int	inFd
				)
{
  int	value;
  int	sum	= 0;
  char buf[BUFFER_LEN];
  int num;
  num = sizeof(buf);
  int file;
  int x;
  //  YOUR CODE HERE
  while ((file = read(inFd, buf, BUFFER_LEN)) > 0) {
	  value = buf[x];
	  sum = sum + value;
  }
  write(inFd, &value, sizeof(value));
  printf("%d\n", sum);
  return(EXIT_SUCCESS);
}


//  PURPOSE:  To open() the 'argc-1' files whose paths are given in 'argv[]'.
//	For each file (for example, "foo.txt"), to write() its contents to
//	socket-pair file descriptor 'converterFd', and to read() from
//	'converterFd' the same socket pair the same number of bytes, AND
//	an integer.  To write() the same number of bytes as is in the buffer
//	to a new file ("foo.txt.converted", in our example), and write()
//	the integer to 'toSummerFd'.
void		readAndConvertFiles
				(int		argc,
				 char*		argv[],
				 int		converterFd,
				 int		toSummerFd
				)
{
  //  I.  Application validity check:

  //  II.  Convert files:
  //  II.A.  Each iteration converts one file:
  for  (int argIndex = 1;  argIndex < argc;  argIndex++)
  {
    //  II.A.1.  Attempt to open source file:
    const char*	inputFilepathCPtr	= argv[argIndex];
    int	  	inFd;

    //  YOUR CODE HERE
    inFd	= open(inputFilepathCPtr,O_RDONLY);
    if  (inFd < 0)
  {
    fprintf(stderr,"Cannot open %s\n",inputFilepathCPtr);
    continue;
      }

    //  II.A.2.  Attempt to open destination file:
    char	outputFilepath[BUFFER_LEN];
    int		outFd;

    //  YOUR CODE HERE
    snprintf(outputFilepath,BUFFER_LEN,"%ss%",inputFilepathCPtr,NEW_EXTENSION);
	outFd	= creat(outputFilepath,0660);
	 if  (outFd < 0)
  {
    fprintf(stderr,"Cannot open %s\n",outputFilepath);
    close(inFd);
    continue;
  }

    //  II.A.3.  Attempt to convert file:
    char	buffer[BUFFER_LEN];
    int		numChars;
    int		numConvertedChars;

    //  YOUR CODE HERE
	while ((numChars = read(inFd, buffer, BUFFER_LEN)) > 0) {

		numConvertedChars = write(converterFd, buffer, numChars);
		read(converterFd, buffer, size_t(numConvertedChars));
		numConvertedChars = write(outFd, buffer, size_t(numConvertedChars));
		read(converterFd, &numConvertedChars, size_t(numConvertedChars));
		write(toSummerFd, &numConvertedChars, size_t(numConvertedChars));
	}

    //  II.A.4.  Clean up afterwards:
    close(outFd);
    close(inFd);
  }

  //  III.  Finished:
}


int		main		(int		argc,
				 char*		argv[]
				)
{
  //  I.  Application validity check:

  //  II.A.  Initialize summer process:
  int		toSummer[2];
  pid_t		summerPid;

  //  YOUR CODE HERE
  if(pipe(toSummer)<0)
  {
	fprintf(stderr,"Cannot create a pipe:(\n");
	exit(EXIT_FAILURE);

  }
  summerPid = fork();
  if(summerPid<0)
   {
		fprintf(stderr,"cannot create a child process:(\n");
		exit(EXIT_FAILURE);
   }
    if(summerPid==0)
	{
		dup2(toSummer[STDOUT_FILENO], STDOUT_FILENO);
		execl("/usr/bin/ls","ls",NULL);
		fprintf(stderr,"cannot run is :(\n");
		exit(EXIT_FAILURE);
	}


  //  II.B.  Initialize converter process:
  pid_t		converterPid;
  int		toFromConverter[2];
  char          buf[BUFFER_LEN];
  //  YOUR CODE HERE
	if (socketpair(AF_UNIX, SOCK_STREAM, 0, toFromConverter) < 0)
   {
      perror("opening stream socket pair");
      exit(EXIT_FAILURE);
   }

   if ((converterPid = fork()) == -1)
      perror("fork");
   //    else
   // if (converterPid > 0)
   // {     
   //  close(toFromConverter[0]);
   // if (read(toFromConverter[1], buf, BUFFER_LEN) < 0)
   //  perror("reading stream message");
   // printf("%s\n", buf);
   // if (write(toFromConverter[1],  NEW_EXTENSION , sizeof( NEW_EXTENSION )) < 0)
   //  perror("writing stream message");
   //close(toFromConverter[1]);
     //  wait(NULL);
     //  }
    else
    {    
   close(toFromConverter[1]);
   if (write(toFromConverter[1],  NEW_EXTENSION, sizeof( NEW_EXTENSION)) < 0)
      perror("writing stream message");
   if (read(toFromConverter[1], buf, BUFFER_LEN) < 0)
      perror("reading stream message");
   printf("-->%s\n", buf);

   }

  //  II.C.  Handle each file on command line:
  readAndConvertFiles(argc,argv,toFromConverter[0],toSummer[STDOUT_FILENO]);

  //  II.D.  Stop processes:
  close(toFromConverter[0]);
  close(toSummer[STDOUT_FILENO]);

  wait(NULL);
  wait(NULL);

  //  III.  Finished:
  return(EXIT_SUCCESS);
}
	
