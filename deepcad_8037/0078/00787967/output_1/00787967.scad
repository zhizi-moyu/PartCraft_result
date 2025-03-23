
// Parameters for the square plate with a central hole
plate_size = 50; // Length of the square plate (in mm)
plate_thickness = 5; // Thickness of the plate (in mm)
hole_diameter = 20; // Diameter of the central circular hole (in mm)

// Module to create the square plate with a central hole
module square_plate_with_hole() {
    difference() {
        // Create the square plate
        cube([plate_size, plate_size, plate_thickness], center = true);
        
        // Subtract the central circular hole with sharp edges
        translate([0, 0, 0]) {
            cylinder(r = hole_diameter / 2, h = plate_thickness, center = true);
        }
    }
}

// Render the square plate with a central hole
square_plate_with_hole();

