
// Define dimensions for the rectangular block
block_width = 20;  // Width of the block
block_height = 10; // Height of the block
block_depth = 30;  // Depth of the block

// Function to create a rectangular block
module rectangular_block() {
    cube([block_width, block_depth, block_height], center = true);
}

// Generate the stacked layers without gaps
translate([0, 0, block_height * 2.5]) rectangular_block(); // Layer 1
translate([0, 0, block_height * 1.5]) rectangular_block(); // Layer 2
translate([0, 0, block_height * 0.5]) rectangular_block(); // Layer 3
translate([0, 0, -block_height * 0.5]) rectangular_block(); // Layer 4
translate([0, 0, -block_height * 1.5]) rectangular_block(); // Layer 5
translate([0, 0, -block_height * 2.5]) rectangular_block(); // Layer 6

