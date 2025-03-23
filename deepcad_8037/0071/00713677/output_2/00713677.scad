
// Define dimensions for the rectangular block
block_length = 20;  // Length of the block (reduced to match original model)
block_width = 20;   // Width of the block (unchanged)
block_height = 50;  // Height of the block (increased to match original model)

// Create the rectangular block with proper orientation and alignment
rotate([0, 0, 90])  // Rotate the block by 90 degrees to position it vertically
translate([0, 0, 0])  // Ensure the block is perfectly aligned without tilt
cube([block_length, block_width, block_height]);

