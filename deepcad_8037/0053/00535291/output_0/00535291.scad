
// Define dimensions for the blocks
block_width = 50;  // Width of the blocks
block_depth = 50;  // Depth of the blocks
block_height = 20; // Height of the blocks

// Base block
module base_block() {
    cube([block_width, block_depth, block_height], center = true);
}

// Top block
module top_block() {
    cube([block_width, block_depth, block_height], center = true);
}

// Assembly
translate([0, 0, -block_height / 2]) base_block(); // Position the base block
translate([0, 0, block_height / 2]) top_block();  // Position the top block directly above the base block

