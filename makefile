CC := gcc -Wl,-melf_i386
AS := as --32
LD := ld -m elf_i386

SRCDIR = ./src
BIN = ./bin

OUT = $(BIN)/boot.bin

IMAGE = $(BIN)/boot.img

CCFLAGS  = -m32 -std=c11 -m32
CCFLAGS += -O2 -g -v -Wall
CCFLAGS += -Wextra -Wpedantic
CCFLAGS += -Wstrict-aliasing
CCFLAGS += -Wno-pointer-arith
CCFLAGS += -Wno-unused-parameter
CCFLAGS += -nostdlib -nostdinc
CCFLAGS += -ffreestanding
CCFLAGS += -fno-stack-protector
CCFLAGS += -fno-builtin-function
CCFLAGS += -fno-pie -fno-builtin
CCFLAGS += $(INCFLAGS)

ASFLAGS  = -O2 -g -D -v

BOOTSECT_SRCS = $(SRCDIR)/boot.asm
BOOTSECT_OBJS = $(BOOTSECT_SRCS:.asm=.o)

INCFLAGS  = -I $(SRCDIR)

SRC = $(shell find $(SRCDIR) -name "*.c")
OBJ = $(SRC:.c=.o)

%.o: %.asm
	$(AS) -o $@ -MMD -c $< $(ASFLAGS)
	@echo "Compiling $< to $@"

%.o: %.c
	$(CC) -o $@ -MMD -c $< $(CCFLAGS)
	@echo "Compiling $< to $@"

boot: $(BOOTSECT_OBJS) $(OBJ)
	$(LD) -o $(OUT) $(BOOTSECT_OBJS) $(filter %.o, $(OBJ)) -Ttext 0x7C00 --oformat=binary

image:
	dd if=/dev/zero of=$(IMAGE) bs=512 seek=0 count=1
	dd if=$(OUT) of=$(IMAGE) conv=notrunc bs=512 seek=0 count=1
#dd if=$(KERNEL) of=$(IMAGE) conv=notrunc bs=512 seek=1 count=2048

emu:
	qemu-system-x86_64 -drive file=$(IMAGE),format=raw,index=0,media=disk

clean:
	rm $(filter %.o, $(OBJ))
	rm $(IMAGE) $(filter %.bin, $(shell find bin -name "*.bin"))

run: boot image emu clean
