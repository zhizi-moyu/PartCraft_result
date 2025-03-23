
// Define dimensions for the rectangular block
block_length = 60;  // Updated length of the block to match the original model
block_width = 40;   // Updated width of the block to match the original model
block_height = 20;  // Updated height (thickness) of the block to match the original model

// Create the rectangular block
module rectangular_block() {
    cube([block_length, block_width, block_height], center = true);
}

// Adjust the orientation to ensure alignment and symmetry
rotate([0, 0, 0]) {  // Removed any tilt or rotation to match the upright orientation of the original model
    rectangular_block();
}

