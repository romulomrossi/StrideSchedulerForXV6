#include "types.h"
#include "stat.h"
#include "user.h"
#include "traps.h"
#include "param.h"

#define N 10

unsigned long next=1;
unsigned int lcg_rand(int b)
{ 
    unsigned long a = ((unsigned long)b * 279470273UL) % 42949671UL;
    return a < 0 ? -1*a : a;
}

void 
wait_(unsigned int  seed)
{
  if(seed<=0)
    return;
  seed--;
  wait_(seed);
}

int counter = 0;

void new_fork(unsigned int tickets){
   
    if(counter >=  N)
      return;

    counter++;
    int pid = fork(1);
    cht(pid, tickets);
    if(pid == 0){
      new_fork(tickets+100);
    }
    if(pid > 0){
        for(int i = 0; i < 1012; i++){
          for(int j = 0; j < 13829; j++){
             printf(1, "");
          }
        }
    }
    printf(1, "Returning Pid >>>> %d with %d tickets\n", pid, tickets);
    wait();
    exit();
}

int
main(void)
{
  printf(1, "test\n");
  new_fork(100);

  exit();
}