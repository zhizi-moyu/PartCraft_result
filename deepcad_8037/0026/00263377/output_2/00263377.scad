
// Define the dimensions of the rectangular blocks
block_length_1 = 25;  // Adjusted length for Block 1 to match the original model
block_width_1 = 30;   // Adjusted width for Block 1 to match the original model
block_height_1 = 20;  // Adjusted height for Block 1 to match the original model

block_length_2 = 40;  // Length for Block 2 remains the same
block_width_2 = 20;   // Width for Block 2 remains the same
block_height_2 = 10;  // Height for Block 2 remains the same

block_length_3 = 40;  // Length for Block 3 remains the same
block_width_3 = 20;   // Width for Block 3 remains the same
block_height_3 = 10;  // Height for Block 3 remains the same

block_length_4 = 40;  // Length for Block 4 remains the same
block_width_4 = 20;   // Width for Block 4 remains the same
block_height_4 = 10;  // Height for Block 4 remains the same

block_length_5 = 40;  // Adjusted length for Block 5 to match the original model
block_width_5 = 30;   // Adjusted width for Block 5 to match the original model
block_height_5 = 20;  // Adjusted height for Block 5 to match the original model

block_length_6 = 40;  // Length for Block 6 remains the same
block_width_6 = 20;   // Width for Block 6 remains the same
block_height_6 = 10;  // Height for Block 6 remains the same

// Function to create a rectangular block
module rectangular_block(length, width, height) {
    color("white") {
        cube([length, width, height], center = true);
    }
}

// Generate six rectangular blocks with modifications
translate([-60, 0, 0]) rectangular_block(block_length_1, block_width_1, block_height_1);  // Block 1
translate([-30, 0, 0]) rotate([0, 0, 45]) rectangular_block(block_length_2, block_width_2, block_height_2);  // Block 2 rotated to match original
translate([0, 0, 0]) rectangular_block(block_length_3, block_width_3, block_height_3);    // Block 3 repositioned closer to center
translate([30, 5, 0]) rectangular_block(block_length_4, block_width_4, block_height_4);   // Block 4 remains the same
translate([60, 0, 0]) rectangular_block(block_length_5, block_width_5, block_height_5);   // Block 5 dimensions adjusted
translate([90, 0, 5]) rectangular_block(block_length_6, block_width_6, block_height_6);   // Block 6 adjusted vertically

