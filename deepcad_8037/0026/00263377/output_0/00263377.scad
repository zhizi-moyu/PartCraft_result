
// Define the dimensions of the rectangular block
block_length = 40;  // Length of the block
block_width = 20;   // Width of the block
block_height = 10;  // Height of the block

// Function to create a rectangular block
module rectangular_block() {
    color("white") {
        cube([block_length, block_width, block_height], center = true);
    }
}

// Generate six identical rectangular blocks
translate([-60, 0, 0]) rectangular_block();  // Block 1
translate([-30, 0, 0]) rectangular_block();  // Block 2
translate([0, 0, 0]) rectangular_block();    // Block 3
translate([30, 0, 0]) rectangular_block();   // Block 4
translate([60, 0, 0]) rectangular_block();   // Block 5
translate([90, 0, 0]) rectangular_block();   // Block 6

