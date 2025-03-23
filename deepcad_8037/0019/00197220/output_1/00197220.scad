
// Parameters for the rectangular plate
plate_length = 50;  // Length of the plate
plate_width = 30;   // Width of the plate
plate_thickness = 12; // Total thickness of the plate (merged from 6 layers)

// Function to create a single rectangular plate
module rectangular_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Create the single solid rectangular plate
rectangular_plate();

