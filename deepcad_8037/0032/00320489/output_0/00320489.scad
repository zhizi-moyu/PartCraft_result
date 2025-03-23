
// Define dimensions for the components
large_block_length = 40;  // Length of the large rectangular block
large_block_width = 20;   // Width of the large rectangular block
large_block_height = 10;  // Height of the large rectangular block

small_block_length = 20;  // Length of the small rectangular block
small_block_width = 20;   // Width of the small rectangular block
small_block_height = 10;  // Height of the small rectangular block

// Define the positional relationship between components
gap_between_blocks = 10;  // Vertical gap between the two blocks

// Layer 1: Large rectangular block
module rectangular_block_large() {
    cube([large_block_length, large_block_width, large_block_height], center = true);
}

// Layer 2: Small rectangular block
module rectangular_block_small() {
    cube([small_block_length, small_block_width, small_block_height], center = true);
}

// Assemble the model
module assembly() {
    // Position the large block at the top
    translate([0, 0, large_block_height / 2 + gap_between_blocks + small_block_height / 2])
        rectangular_block_large();

    // Position the small block below the large block
    translate([0, 0, -large_block_height / 2 - gap_between_blocks - small_block_height / 2])
        rectangular_block_small();
}

// Render the assembly
assembly();

