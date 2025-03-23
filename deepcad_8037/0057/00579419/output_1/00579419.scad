
// Define dimensions for the rectangular block
length = 70;  // Adjusted length to match the original model's longer proportions
width = 40;   // Adjusted width to match the original model's proportions
height = 20;  // Height remains the same

// Adjust the position and orientation of the block
translate([0, 0, -10])  // Lower the block to match the original vertical position
rotate([0, 0, 0])       // Align the block horizontally (remove tilt)
cube([length, width, height]);

