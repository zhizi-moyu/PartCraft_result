
// Define the dimensions of a single rectangular plate
module rectangular_plate(length, width, thickness) {
    cube([length, width, thickness], center = true);
}

// Parameters for the rectangular plates
plate_length = 50;      // Length of each plate
plate_width = 20;       // Width of each plate
plate_thickness = 2;    // Thickness of each plate
plate_spacing = 2;      // Spacing between plates
plate_count = 6;        // Number of plates

// Render the stacked plates
module stacked_plates() {
    for (i = [0:plate_count-1]) {
        translate([0, 0, i * (plate_thickness + plate_spacing)])
            rectangular_plate(plate_length, plate_width, plate_thickness);
    }
}

// Call the stacked plates module
stacked_plates();

