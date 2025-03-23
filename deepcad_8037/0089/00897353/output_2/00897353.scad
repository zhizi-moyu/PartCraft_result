
// Define dimensions for the rectangular block
block_length = 50;  // Reduced length to match the original model proportions
block_width = 25;   // Reduced width to match the original model proportions
block_height = 30;  // Increased height to match the original model proportions

// Adjust orientation and position
translate([0, 0, 15])  // Adjusted position to match the height of the original model
rotate([0, 0, 0])      // Corrected orientation to align with the original model
cube([block_length, block_width, block_height]);

