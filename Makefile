ASM = nasm
CC = gcc

SRC = main/main.asm
OBJ = objs/main.o

TARGET = app

FLAGS = -f elf64

all: $(TARGET)

$(TARGET): clean $(OBJ)
	$(CC) -no-pie $(OBJ) -o $(TARGET)

$(OBJ):
	$(ASM) $(FLAGS) $(SRC) -o $(OBJ)

clean:
	rm -f $(OBJ) $(TARGET)

run:
	xterm ./$(TARGET)

rundel: all
	xterm -e ./$(TARGET)
	rm -f $(TARGET) $(OBJ)

.PHONY: make clean run rundel
