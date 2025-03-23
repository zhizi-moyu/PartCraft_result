
// Define the dimensions of the rectangular block
block_length = 50;  // Length of the block
block_width = 25;   // Width of the block
block_height = 10;  // Height of the block

// Function to create a rectangular block
module rectangular_block() {
    cube([block_length, block_width, block_height], center = true);
}

// Stack the rectangular blocks based on the positional relationship
translate([0, 0, block_height * 2.5]) rectangular_block(); // Layer 1
translate([0, 0, block_height * 1.5]) rectangular_block(); // Layer 2
translate([0, 0, block_height * 0.5]) rectangular_block(); // Layer 3
translate([0, 0, -block_height * 0.5]) rectangular_block(); // Layer 4
translate([0, 0, -block_height * 1.5]) rectangular_block(); // Layer 5
translate([0, 0, -block_height * 2.5]) rectangular_block(); // Layer 6

