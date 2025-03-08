SRC_DIR=src
SIM_DIR=sim
BUILD_DIR=build

# Get all source and testbench files
SRC=$(wildcard $(SRC_DIR)/*.v)
SIM=$(wildcard $(SIM_DIR)/*_tb.v)

# Create build targets
BUILD_SRC=$(patsubst $(SRC_DIR)/%.v,$(BUILD_DIR)/%,$(SRC))
BUILD_SIM=$(patsubst $(SIM_DIR)/%.v,$(BUILD_DIR)/%,$(SIM))

all: $(BUILD_SRC) $(BUILD_SIM)

# Compile source files
$(BUILD_DIR)/%: $(SRC_DIR)/%.v $(SRC)
	mkdir -p $(BUILD_DIR)
	iverilog -o $@ -s $(notdir $(basename $@)) $^

# Compile testbench files
$(BUILD_DIR)/%_tb: $(SIM_DIR)/%_tb.v $(SRC)
	mkdir -p $(BUILD_DIR)
	iverilog -o $@ -s $(notdir $(basename $@)) $< $(SRC)

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
