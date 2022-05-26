#include <stdio.h>

extern int funcA(char* str);

int main(int argc, char **argv)
{
  int res;
  
  if (argc != 2){
    fprintf(stderr,"Usage: task1 no input required \n");
    return 0;
  }
  
  
  
  res = funcA(argv[1]);
  printf("The result is : %d", res);
	
  return 0;
}