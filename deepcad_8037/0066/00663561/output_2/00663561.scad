// Parameters for the rectangular plate
plate_length = 50;  // Length of the plate
plate_width = 30;   // Width of the plate
plate_thickness = 2; // Thickness of the plate

// Function to create a rectangular plate
module rectangular_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Generate a single rectangular plate in the correct orientation
translate([0, 0, 0]) rotate([90, 0, 0]) rectangular_plate();
