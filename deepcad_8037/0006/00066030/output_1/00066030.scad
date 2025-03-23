
// Define the dimensions of the rectangular block
length = 70;  // Adjusted length to match the original model proportions
width = 20;   // Width remains unchanged
height = 12;  // Adjusted height to match the original model proportions

// Adjust the position and orientation of the block
translate([0, 0, -5])  // Lowered the block to match the vertical position of the original model
rotate([0, 0, 0])      // Removed rotation to align the block horizontally
cube([length, width, height], center = true);

