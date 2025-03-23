
// Define dimensions for the rectangular block
block_length = 40;  // Length of the block
block_width = 20;   // Width of the block
block_height = 10;  // Height of the block

// Function to create a rectangular block
module rectangular_block(length, width, height) {
    cube([length, width, height], center = true);
}

// Generate six rectangular blocks positioned independently
translate([-60, 0, 0]) rectangular_block(45, block_width, block_height);  // Block 1: Increased length to 45
translate([-30, 0, 0]) rotate([0, 0, 10]) rectangular_block(block_length, block_width, block_height);  // Block 2: Rotated by 10 degrees
translate([0, 0, -5]) rectangular_block(block_length, block_width, block_height);  // Block 3: Lowered by 5 units
translate([35, 0, 0]) rectangular_block(block_length, block_width, block_height);  // Block 4: Shifted 5 units to the right
translate([60, 0, 0]) rectangular_block(block_length, 25, block_height);  // Block 5: Increased width to 25
translate([90, 0, 0]) rotate([0, 0, -15]) rectangular_block(block_length, block_width, block_height);  // Block 6: Rotated back by -15 degrees

