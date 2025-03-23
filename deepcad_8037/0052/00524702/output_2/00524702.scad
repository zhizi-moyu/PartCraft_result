
// Define the dimensions of the rectangular block
block_length = 50;  // Length of the block
block_width = 20;   // Width of the block
block_height = 20;  // Height of the block (increased to match original model)

// Function to create a rectangular block
module rectangular_block() {
    cube([block_length, block_width, block_height], center = true);
}

// Assemble the layers based on the original model
module assembly() {
    // Layer 1: Topmost block
    translate([0, 0, block_height * 2.5])
        rectangular_block();

    // Layer 2: Second block
    translate([0, 0, block_height * 1.5])
        rectangular_block();

    // Layer 3: Third block
    translate([0, 0, block_height * 0.5])
        rectangular_block();

    // Layer 4: Fourth block
    translate([0, 0, -block_height * 0.5])
        rectangular_block();

    // Layer 5: Fifth block
    translate([0, 0, -block_height * 1.5])
        rectangular_block();

    // Layer 6: Bottommost block
    translate([0, 0, -block_height * 2.5])
        rectangular_block();
}

// Render the assembly
assembly();

