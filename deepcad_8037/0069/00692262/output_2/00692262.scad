
// Define dimensions for the rectangular blocks
block_length = 60;  // Length of the block
block_width = 20;   // Width of the block
block_height = 10;  // Height of the block

// Function to create a rectangular block
module rectangular_block() {
    cube([block_length, block_width, block_height], center = true);
}

// Generate individual blocks based on the original model configuration
// Adjusted to match the original model's horizontal layout and spacing
translate([0, 0, 0]) rectangular_block(); // Block 1
translate([block_length + 10, 0, 0]) rectangular_block(); // Block 2
translate([-(block_length + 10), 0, 0]) rectangular_block(); // Block 3
translate([0, block_width + 10, 0]) rectangular_block(); // Block 4
translate([0, -(block_width + 10), 0]) rectangular_block(); // Block 5
translate([0, 0, -(block_height + 10)]) rectangular_block(); // Block 6

