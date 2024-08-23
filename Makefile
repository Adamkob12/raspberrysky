# PARAMETERS

TARGET_TRIPLE = aarch64-unknown-none-softfloat
PROFILE = debug

# FILES

BUILD_DIR = build
TARGET_DIR = target
KERNEL_IMG_NAME = kernel8.img
ELF_NAME = raspberrysky

ELF_PATH = $(BUILD_DIR)/$(ELF_NAME).elf
IMG_PATH = $(BUILD_DIR)/$(KERNEL_IMG_NAME)

# TOOLS
TOOLCHAIN = aarch64-none-elf
CARGO = cargo
OBJCOPY = $(TOOLCHAIN)-objcopy

# FLAGS
DISSASM_FLAGS = -D

# ACTIONS

all: $(IMG_PATH)

clean:
	cargo clean
	rm -rf build/*

dissasm: $(ELF_PATH)
	$(TOOLCHAIN)-objdump $(DISSASM_FLAGS) $(ELF_PATH) > $(BUILD_DIR)/diss.txt

$(ELF_PATH):
	$(CARGO) build
	cp $(TARGET_DIR)/$(TARGET_TRIPLE)/$(PROFILE)/$(ELF_NAME) $(ELF_PATH)

$(IMG_PATH): $(ELF_PATH)
	$(OBJCOPY) $(ELF_PATH) -O binary $(BUILD_DIR)/$(KERNEL_IMG_NAME)
	rm $(ELF_PATH)
