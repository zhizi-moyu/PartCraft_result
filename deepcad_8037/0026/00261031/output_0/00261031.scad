
// Define the dimensions of the rectangular plate
module rectangular_plate(length, width, thickness) {
    cube([length, width, thickness], center = true);
}

// Parameters for the rectangular plates
plate_length = 50;  // Length of the plate
plate_width = 20;   // Width of the plate
plate_thickness = 2; // Thickness of the plate
plate_spacing = 5;   // Spacing between plates

// Generate the stack of rectangular plates
module stacked_plates() {
    for (i = [0:5]) {
        translate([0, 0, i * (plate_thickness + plate_spacing)])
            rectangular_plate(plate_length, plate_width, plate_thickness);
    }
}

// Render the stacked plates
stacked_plates();

