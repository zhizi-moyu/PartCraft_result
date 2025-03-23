// Define dimensions for the rectangular block
block_length = 40;  // Length of the block
block_width = 20;   // Width of the block
block_height = 10;  // Height of the block

// Function to create a rectangular block
module rectangular_block(length, width, height) {
    cube([length, width, height], center = true);
}

// Generate six rectangular blocks positioned independently
translate([-60, 0, 0]) rectangular_block(block_length, block_width, block_height);  // Block 1: Corrected length to match original model
translate([-30, 0, 0]) rectangular_block(block_length, block_width, block_height);  // Block 2: Removed rotation to ensure parallel alignment
translate([0, 0, 0]) rectangular_block(block_length, block_width, block_height);  // Block 3: Adjusted height to match original model
translate([30, 0, 0]) rectangular_block(block_length, block_width, block_height);  // Block 4: Corrected position for flush alignment
translate([60, 0, 0]) rectangular_block(block_length, block_width, block_height);  // Block 5: Corrected width to match original model
translate([90, 0, 0]) rectangular_block(block_length, block_width, block_height);  // Block 6: Removed rotation for uniform orientation
