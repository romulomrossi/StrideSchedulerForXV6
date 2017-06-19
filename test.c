#include "types.h"
#include "stat.h"
#include "user.h"
#include "traps.h"
#include "param.h"

#define N 10

unsigned long next=1;
unsigned int lcg_rand()
{ 
    unsigned long a = ((unsigned long)next++ * 279470273UL) % 42949671UL;
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
    int pid = fork(-1);
    cht(pid, tickets);
    if(pid == 0){
      new_fork(lcg_rand()%200);
    }

    if(pid > 0){
        for(int i = 0; i < 10000; i++){
          for(int j = 0; j < 1123456789; j++)
                 wait_(10000000);
        }
    }
    wait_(lcg_rand());
    wait();
    printf(1, "Returning Pid >>>> %d with %d tickets\n", pid, tickets);
    exit();
}

int
main(void)
{
  printf(1, "test\n");
  new_fork(100);

  exit();
}