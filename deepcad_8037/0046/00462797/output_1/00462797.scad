
// Define dimensions for the blocks
large_block_size = [60, 30, 10];  // [length, width, height]
medium_block_size = [40, 20, 10];
small_block_size = [20, 10, 10];

// Define positions for each block
large_block_positions = [
    [-70, 0, 0],  // First large block
    [70, 0, 0]    // Second large block
];

medium_block_positions = [
    [-35, 0, 0],  // First medium block
    [35, 0, 0]    // Second medium block
];

small_block_positions = [
    [-15, 0, 0],  // First small block
    [15, 0, 0]    // Second small block
];

// Create the blocks
module large_rectangular_block() {
    cube(large_block_size, center = true);
}

module medium_rectangular_block() {
    cube(medium_block_size, center = true);
}

module small_rectangular_block() {
    cube(small_block_size, center = true);
}

// Assemble the model
for (pos = large_block_positions) {
    translate(pos) large_rectangular_block();
}

for (pos = medium_block_positions) {
    translate(pos) medium_rectangular_block();
}

for (pos = small_block_positions) {
    translate(pos) small_rectangular_block();
}

