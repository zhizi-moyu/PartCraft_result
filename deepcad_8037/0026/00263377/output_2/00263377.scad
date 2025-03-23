
// Define dimensions for the rectangular block
block_width = 20;  // Width of the block
block_depth = 10;  // Depth of the block
block_height = 5;  // Height of the block

// Function to create a rectangular block
module rectangular_block() {
    cube([block_width, block_depth, block_height], center = true);
}

// Generate the vertical stack of rectangular blocks
translate([0, 0, block_height * 5]) rectangular_block(); // Layer 1
translate([0, 0, block_height * 4]) rectangular_block(); // Layer 2
translate([0, 0, block_height * 3]) rectangular_block(); // Layer 3
translate([0, 0, block_height * 2]) rectangular_block(); // Layer 4
translate([0, 0, block_height * 1]) rectangular_block(); // Layer 5
translate([0, 0, block_height * 0]) rectangular_block(); // Layer 6

