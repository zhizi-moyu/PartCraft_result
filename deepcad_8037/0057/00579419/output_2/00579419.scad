
// Define dimensions for the rectangular block
length = 100;  // Increased length to match the original model's proportions
width = 50;    // Adjusted width to match the original model's proportions
height = 30;   // Adjusted height to match the original model's proportions

// Adjust the position and orientation of the block
translate([10, 10, -15])  // Repositioned closer to the center and lowered to match the original vertical position
rotate([0, 15, 0])        // Rotated to match the original block's orientation
cube([length, width, height], center = true);  // Ensured sharp edges by not applying any rounding

