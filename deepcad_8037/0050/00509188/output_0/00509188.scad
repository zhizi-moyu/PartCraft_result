
// Parameters for the flat plate with square cutout
plate_length = 50;  // Length of the rectangular plate
plate_width = 50;   // Width of the rectangular plate
plate_thickness = 2; // Thickness of the plate
cutout_size = 20;   // Size of the square cutout

// Module to create the flat plate with a square cutout
module flat_plate_with_square_cutout() {
    difference() {
        // Create the rectangular plate
        cube([plate_length, plate_width, plate_thickness], center = true);
        // Create the square cutout
        translate([0, 0, plate_thickness / 2])
            cube([cutout_size, cutout_size, plate_thickness + 1], center = true);
    }
}

// Render the flat plate with square cutout
flat_plate_with_square_cutout();

