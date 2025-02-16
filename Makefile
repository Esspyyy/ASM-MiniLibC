##
## EPITECH PROJECT, 2025
## B-ASM-400-LYN-4-1-asmminilibc-spencer.pay
## File description:
## Makefile
##

NAME	=	libasm.so

SRCS	=	strlen.asm

OBJS	=	$(SRCS:.asm=.o)

ASM	=	nasm
ASMFLAGS=	-f elf64

LD	=	ld
LDFLAGS	=	-shared

RM	=	rm -f

%.o: %.asm
	$(ASM) $(ASMFLAGS) -o $@ $<

all: $(NAME)

$(NAME): $(OBJS)
	$(LD) $(LDFLAGS) -o $(NAME) $(OBJS)

test: $(NAME)
	gcc -o test main.c
	LD_PRELOAD=./$(NAME) ./test

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
