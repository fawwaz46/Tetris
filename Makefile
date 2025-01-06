# Compiler and flags
CXX = clang++
CXXFLAGS = -Wall -std=c++14 -I/opt/homebrew/include -Isrc

# Linker flags
LDFLAGS = -L/opt/homebrew/lib -lraylib -framework OpenGL -framework OpenAL -framework Cocoa -framework IOKit

# Project name
TARGET = game

# Source and object files
SRC = src/main.cpp src/grid.cpp src/colors.cpp src/block.cpp src/blocks.cpp src/position.cpp src/game.cpp
OBJ = $(SRC:.cpp=.o)

# Default target
all: $(TARGET)

# Link the target
$(TARGET): $(OBJ)
	$(CXX) -o $@ $^ $(LDFLAGS)

# Compile source files into object files
%.o: %.cpp
	$(CXX) -c $< -o $@ $(CXXFLAGS)

# Clean build files
clean:
	rm -f $(OBJ) $(TARGET)
	@echo "Cleaned up!"

# Run the program
run: all
	./$(TARGET)