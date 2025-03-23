
// Define the dimensions of the rectangular plate
module rectangular_plate(length, width, thickness) {
    cube([length, width, thickness], center = true);
}

// Parameters for the rectangular plate
plate_length = 50;  // Length of the plate
plate_width = 20;   // Width of the plate
plate_thickness = 12; // Combined thickness of the original six plates (6 * 2)

// Render the single solid rectangular plate
rectangular_plate(plate_length, plate_width, plate_thickness);

