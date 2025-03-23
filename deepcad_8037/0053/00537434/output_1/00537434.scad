
// Parameters for the flat plate
plate_length = 50;  // Length of the flat plate
plate_width = 50;   // Width of the flat plate
plate_thickness = 2; // Thickness of the flat plate
plate_spacing = 10;  // Spacing between each plate

// Function to create a flat plate
module flat_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Individual flat plates positioned separately
module separated_flat_plates() {
    for (i = [0:5]) {
        translate([0, 0, -i * (plate_thickness + plate_spacing)])
            flat_plate();
    }
}

// Render the separated flat plates
separated_flat_plates();

