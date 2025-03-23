
// Parameters for the rectangular plate
plate_length = 50;  // Length of the plate
plate_width = 30;   // Width of the plate
plate_thickness = 5; // Thickness of the plate

// Function to create the rectangular plate
module rectangular_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Main model
rectangular_plate();

