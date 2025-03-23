
// Define dimensions for the rectangular plate
plate_length = 100;  // Length of the plate
plate_width = 60;    // Width of the plate
plate_thickness = 5; // Thickness of the plate

// Create the rectangular plate
module rectangular_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Render the model
rectangular_plate();

