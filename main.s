#
#   A simple hello world application
#

#.intel_syntax noprefix
.global _start

.set SYS_write, 1
.set SYS_exit, 60

.set stdin, 0
.set stdout, 1
.set stderr, 2

.section .text
_start:
    push stdout
    lea msg, %rax
    push %rax
    push msg_len
    call write

    push 0
    call exit

write:
    mov %rax, SYS_write  # Syscall id write
    mov %rdi, 24(%rsp) # File descriptor
    mov %rsi, 16(%rsp) # Buffer
    mov %rdx, 8(%rsp)  # Buffer length 
    syscall
    ret $24              # Return and clean up the stack

exit:
    mov %rax, SYS_exit   # Syscall id exit
    mov %rdi, 8(%rsp)  # Exit code
    syscall
    ret $8               # Return and clean up the stack


.data
msg: 
    .asciz "Hello World!\n"
msg_len:
    .int . - msg
