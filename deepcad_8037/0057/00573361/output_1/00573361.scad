
// Define dimensions for the rectangular block
block_length = 50;  // Length of the block
block_width = 20;   // Width of the block
block_height = 10;  // Height of the block

// Adjust the orientation of the rectangular block
rotate([0, 0, 90])  // Rotate the block to align it vertically
cube([block_length, block_width, block_height]);

