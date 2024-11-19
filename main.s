#
#   A simple hello world application (AT&T)
#

.global _start

.set SYS_write, 1
.set SYS_exit, 60

.set stdin, 0
.set stdout, 1
.set stderr, 2

.section .text
_start:
    push $stdout
    lea msg, %rax
    push %rax
    push msg_len
    call write

    push $0
    call exit

write:
    mov $SYS_write, %rax        # Syscall id write
    mov 24(%rsp), %rdi          # File descriptor
    mov 16(%rsp), %rsi          # Buffer
    mov 8(%rsp), %rdx           # Buffer length 
    syscall
    ret $24                     # Return and clean up the stack

exit:
    mov $SYS_exit, %rax         # Syscall id exit
    mov 8(%rsp), %rdi           # Exit code
    syscall
    ret $8                      # Return and clean up the stack


.section .data
msg: 
    .asciz "Hello World!\n"
msg_len:
    .int . - msg 
