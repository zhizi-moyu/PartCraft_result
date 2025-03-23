
// Parameters for the flat square plate
plate_size = 50; // Length of one side of the square
plate_thickness = 2; // Thickness of the plate

// Function to create a flat square plate
module flat_square_plate() {
    cube([plate_size, plate_size, plate_thickness], center = true);
}

// Generate the flat square plate
flat_square_plate();

