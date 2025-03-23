
// Define parameters for the rectangular plate with a hole
plate_length = 50;  // Length of the rectangular plate
plate_width = 30;   // Width of the rectangular plate
plate_thickness = 5; // Thickness of the rectangular plate
hole_diameter = 20; // Diameter of the centered circular hole

// Function to create a rectangular plate with a centered hole
module rectangular_plate_with_hole() {
    difference() {
        cube([plate_length, plate_width, plate_thickness], center = true);
        cylinder(r = hole_diameter / 2, h = plate_thickness + 1, center = true);
    }
}

// Generate a single rectangular plate with a hole
rectangular_plate_with_hole();

