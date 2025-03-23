
// Parameters
plate_size = 50; // Length of the square plate (in mm)
plate_thickness = 5; // Thickness of the plate (in mm)
hole_diameter = 30; // Diameter of the central circular hole (in mm)

// Main module
module square_plate_with_hole() {
    // Create the square plate
    difference() {
        cube([plate_size, plate_size, plate_thickness], center=true); // Square plate
        cylinder(d=hole_diameter, h=plate_thickness + 1, center=true); // Central circular hole
    }
}

// Render the model
square_plate_with_hole();

