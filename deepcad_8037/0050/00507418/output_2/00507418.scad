
// Parameters for the rectangular plate
plate_length = 45;  // Adjusted length to match the original model
plate_width = 10;   // Width remains the same
plate_thickness = 2; // Thickness remains the same

// Function to create a rectangular plate
module rectangular_plate() {
    rotate([0, 0, 3])  // Adjusted rotation to match the original model's alignment
    translate([1.5, -0.5, -1.5])  // Adjusted position to match the original model's placement
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Main model
rectangular_plate();

