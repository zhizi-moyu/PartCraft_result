
// Define dimensions for the rectangular block
block_length = 60;  // Length of the block
block_width = 30;   // Width of the block
block_height = 15;  // Height of the block

// Define dimensions for the square hole
hole_size = 15;     // Side length of the square hole (adjusted to match the original model)

// Create the rectangular block with a square hole
difference() {
    // Main rectangular block
    cube([block_length, block_width, block_height], center = true);
    
    // Square hole
    translate([0, 0, 0])  // Center the hole perfectly
        cube([hole_size, hole_size, block_height * 2], center = true);
}

