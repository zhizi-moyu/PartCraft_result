
// Define the dimensions of the flat plate
plate_length = 100;  // Length of the plate
plate_width = 60;    // Width of the plate
plate_thickness = 5; // Thickness of the plate

// Create the flat rectangular plate
module flat_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Render the flat plate
flat_plate();

