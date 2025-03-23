
// Define dimensions for the blocks
large_block_size = [60, 30, 10];  // [length, width, height]
medium_block_size = [40, 20, 15]; // Adjusted height to match original model
small_block_size = [20, 10, 10];

// Define positions for each block
large_block_positions = [
    [0, 0, 25],  // First large block (aligned centrally at the top)
    [0, 0, -25]  // Second large block (aligned centrally at the base)
];

medium_block_positions = [
    [0, 0, 0],   // First medium block (aligned centrally between large blocks)
    [0, 0, 0]    // Second medium block (added and aligned centrally)
];

small_block_positions = [
    [0, 0, 10],  // First small block (aligned centrally and vertically with medium block)
    [0, 0, -10]  // Second small block (added and positioned symmetrically opposite)
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

