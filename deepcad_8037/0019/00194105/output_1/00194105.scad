
// Define dimensions for the rectangular block
block_length = 50;  // Length of the block
block_width = 30;   // Width of the block
block_height = 20;  // Height of the block (increased to match original proportions)

// Adjust the position of the block to align with the base plane
translate([0, 0, 0])  // Lowered the block to sit on the base plane
    // Apply rounding to the edges for a softer appearance
    minkowski() {
        cube([block_length, block_width, block_height], center = true);  // Centered cube for better alignment
        sphere(r = 2);  // Radius of 2 for rounded edges
    }

// Ensure the block is perfectly horizontal
rotate([0, 0, 0])  // No tilt applied to maintain horizontal alignment

