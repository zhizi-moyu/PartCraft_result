
// Define the dimensions of the rectangular block
length = 80;  // Increased length to match the original model proportions
width = 20;   // Width remains unchanged
height = 10;  // Reduced height to match the original model proportions

// Adjust the position and orientation of the block
translate([0, 0, 0])  // Adjusted vertical position to align with the original model
rotate([0, 0, 0])      // Ensured no rotation to align the block horizontally
cube([length, width, height], center = true);

