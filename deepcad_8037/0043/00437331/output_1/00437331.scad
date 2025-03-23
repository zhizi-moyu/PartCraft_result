
// Define dimensions for the rectangular bar
length = 100;  // Length of the bar
width = 20;    // Width of the bar
height = 10;   // Height of the bar

// Adjust rotation and position to match the original model
translate([10, 15, 5])  // Position the bar in the 3D space
rotate([0, 0, 45])      // Rotate the bar to align with the original model
cube([length, width, height]);

