
// Define dimensions for the rectangular bar
length = 120;  // Adjusted length to match the original model
width = 20;    // Width remains the same
height = 10;   // Height remains the same

// Adjust rotation and position to match the original model
translate([10, 15, 0])  // Lowered the bar along the vertical axis
rotate([0, 0, 0])       // Removed angular tilt to align horizontally
cube([length, width, height]);

