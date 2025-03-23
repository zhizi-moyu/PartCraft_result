
// Define dimensions for the rectangular block
block_length = 60;  // Length of the block
block_width = 30;   // Width of the block
block_height = 10;  // Height of the block

// Define dimensions for the square hole
hole_size = 10;     // Side length of the square hole

// Create the rectangular block with a square hole
difference() {
    // Main rectangular block
    cube([block_length, block_width, block_height], center = true);
    
    // Square hole
    translate([0, 0, -block_height / 2])  // Center the hole vertically
        cube([hole_size, hole_size, block_height * 2], center = true);
}

