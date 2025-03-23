
// Define the dimensions of the rectangular block
block_length = 50;  // Length of the block
block_width = 30;   // Width of the block (increased to match original model)
block_height = 12;  // Height of the block (increased to match original model)

// Function to create a rectangular block
module rectangular_block() {
    cube([block_length, block_width, block_height], center = true);
}

// Adjusted stacking and positioning based on differences_list
translate([0, 0, block_height * 2.5]) rectangular_block(); // Layer 1
translate([0, 0, block_height * 1.5]) rectangular_block(); // Layer 2
translate([0, 0, block_height * 0.5]) rectangular_block(); // Layer 3
translate([0, 0, -block_height * 0.5]) rectangular_block(); // Layer 4
translate([0, 0, -block_height * 1.5]) rectangular_block(); // Layer 5
translate([5, 0, -block_height * 2.5]) rectangular_block(); // Layer 6 (repositioned to match original placement)

// Adjust rotation for block alignment
rotate([0, 0, 0]) rectangular_block(); // Ensures blocks are aligned straight

