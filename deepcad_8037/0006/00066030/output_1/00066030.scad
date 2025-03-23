
// Parameters for the rectangular block
block_length = 240;  // Adjusted length of the block to merge six smaller blocks into one
block_width = 20;    // Width of the block
block_height = 10;   // Height of the block

// Function to create a single rectangular block
module rectangular_block() {
    cube([block_length, block_width, block_height], center = true);
}

// Generate the single continuous rectangular block
translate([0, 0, block_height / 2]) {
    rectangular_block();
}

