all: main.elf

define BUILD_BINARY_O
	$(LD) -r -b binary $< -o $@
endef

define LINK_ELF
	$(LD) --print-memory-usage -Map=$@.map -T main.lds $^ -o $@
endef

%.txt.o: %.txt
	$(BUILD_BINARY_O)

OBJS = header.o load.o main.o

main.elf: $(OBJS) | main.lds
	$(LINK_ELF)

include common.mk
