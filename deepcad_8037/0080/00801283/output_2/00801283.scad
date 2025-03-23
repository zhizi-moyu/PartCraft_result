
// Define parameters for the flat square plate
plate_size = 50; // Length and width of the square plate
plate_thickness = 30; // Adjusted thickness to match the original model

// Function to create a single flat square plate
module flat_square_plate() {
    cube([plate_size, plate_size, plate_thickness], center = true);
}

// Render the model
flat_square_plate();

