
// Define parameters for the flat square plate
plate_size = 50; // Length and width of the square plate
plate_thickness = 5; // Thickness of the plate

// Function to create a flat square plate
module flat_square_plate() {
    cube([plate_size, plate_size, plate_thickness], center = true);
}

// Render a single flat square plate
flat_square_plate();

