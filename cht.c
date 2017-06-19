#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int
main (int argc, char **argv)
{
    int pid = atoi (argv[1]);
    int tickets = atoi(argv[2]);

    if(tickets < 1)
    {
        printf(2, "Invalid number of tickets!");
        exit();
    }
    printf(1, "pid %d recived %d tickets \n ", pid, tickets);
    cht(pid, tickets);  
    exit();
}