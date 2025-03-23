
// Dimensions for the blocks
large_block = [60, 30, 15];  // Length, Width, Height
medium_block = [40, 20, 20];
small_block = [20, 20, 10];

// Function to create a block
module block(size) {
    cube(size, center = true);
}

// Layer 1: Large rectangular block at the bottom
translate([0, 0, -50])  // Positioning the block
    block(large_block);

// Layer 2: Small rectangular block above the large block
translate([0, 0, -50 + large_block[2] / 2 + small_block[2] / 2])
    block(small_block);

// Layer 3: Medium rectangular block above the small block
translate([0, 0, -50 + large_block[2] + small_block[2] / 2 + medium_block[2] / 2])
    block(medium_block);

// Layer 4: Second small rectangular block above the medium block
translate([0, 0, -50 + large_block[2] + small_block[2] + medium_block[2] / 2 + small_block[2] / 2])
    block(small_block);

// Layer 5: Second large rectangular block at the top
translate([0, 0, -50 + large_block[2] + small_block[2] + medium_block[2] + small_block[2] / 2 + large_block[2] / 2])
    block(large_block);

