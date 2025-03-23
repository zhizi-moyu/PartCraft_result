
// Parameters for the rectangular block
block_length = 40;  // Length of the block
block_width = 20;   // Width of the block
block_height = 10;  // Height of the block
block_spacing = 5;  // Spacing between blocks

// Function to create a single rectangular block
module rectangular_block() {
    cube([block_length, block_width, block_height], center = true);
}

// Generate the layer of six rectangular blocks
translate([0, 0, block_height / 2]) {
    for (i = [0:5]) {
        translate([i * (block_length + block_spacing), 0, 0]) {
            rectangular_block();
        }
    }
}

