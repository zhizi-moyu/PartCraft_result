
// Parameters for the square plate with a hole
plate_width = 50; // Width of the square plate
plate_thickness = 5; // Thickness of the plate
hole_diameter = 20; // Diameter of the central hole

// Function to create a square plate with a central hole
module square_plate_with_hole() {
    difference() {
        cube([plate_width, plate_width, plate_thickness], center = true);
        translate([0, 0, -plate_thickness / 2])
            cylinder(h = plate_thickness * 2, d = hole_diameter, center = true);
    }
}

// Call the square_plate_with_hole module to generate the single plate model
square_plate_with_hole();

