ASM = nasm
LINKER = ld

SRC = main/main.asm
OBJ = objs/main.o

TARGET = app

FLAGS = -f elf64

$(TARGET): clean $(OBJ)
	$(LINKER) $(OBJ) -o $(TARGET)

$(OBJ):
	$(ASM) $(FLAGS) $(SRC) -o $(OBJ)

make: $(TARGET)

clean:
	rm -f $(OBJ) $(TARGET)

run:
	./$(TARGET)

rundel: clean make run clean

.PHONY: make clean run rundel
