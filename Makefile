#

TARGET_TRIPLE = aarch64-unknown-none-softfloat
PROFILE = debug

BUILD_DIR = build
TARGET_DIR = target
KERNEL_IMG_NAME = kernel8.img
ELF_NAME = raspberrysky

# TOOLS
TOOLCHAIN = aarch64-none-elf
CARGO = cargo
OBJCOPY = $(TOOLCHAIN)-objcopy

# ACTIONS

all: $(BUILD_DIR)/$(KERNEL_IMG_NAME)

clean:
		cargo clean
		rm -rf build/*

$(BUILD_DIR)/$(ELF_NAME):
	$(CARGO) build
	cp $(TARGET_DIR)/$(TARGET_TRIPLE)/$(PROFILE)/$(ELF_NAME) $(BUILD_DIR)/$(ELF_NAME).elf

$(BUILD_DIR)/$(KERNEL_IMG_NAME): $(BUILD_DIR)/$(ELF_NAME)
	$(OBJCOPY) $(BUILD_DIR)/$(ELF_NAME).elf -O binary $(BUILD_DIR)/$(KERNEL_IMG_NAME)
