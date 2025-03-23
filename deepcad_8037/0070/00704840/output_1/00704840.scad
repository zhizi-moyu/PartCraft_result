
// Define dimensions for the rectangular block
length = 45;  // Adjusted length to match the original model
width = 30;   // Width remains consistent
thickness = 5; // Thickness remains consistent

// Adjusted position offset to align with the original model
x_offset = 0;  // X-axis offset
y_offset = 0;  // Y-axis offset
z_offset = -2; // Z-axis offset

// Create the rectangular block
module rectangular_block() {
    translate([x_offset, y_offset, z_offset]) {
        cube([length, width, thickness], center = true);
    }
}

// Render the model
rectangular_block();

