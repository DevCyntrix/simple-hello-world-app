/**
 *      A simple hello world application
 */
#include <unistd.h>
#include <sys/syscall.h>

int main(int argc, char const *argv[])
{
    syscall(SYS_write, STDOUT_FILENO, "Hello World!\n", 13);
    return 0;
}
