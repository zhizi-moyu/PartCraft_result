
// Define dimensions for the rectangular flat plate
rectangular_plate_length = 60; // Length of the rectangular plate
rectangular_plate_width = 30;  // Width of the rectangular plate
rectangular_plate_thickness = 5; // Thickness of the rectangular plate

// Define dimensions for the square plate with a hole
square_plate_side = 20; // Side length of the square plate
square_plate_thickness = 5; // Thickness of the square plate
hole_diameter = 10; // Diameter of the hole in the square plate

// Define the vertical offset between the two layers
layer_offset = 10; // Distance between the two layers

// Create the rectangular flat plate
module rectangular_flat_plate() {
    cube([rectangular_plate_length, rectangular_plate_width, rectangular_plate_thickness], center = true);
}

// Create the square plate with a hole
module square_plate_with_hole() {
    difference() {
        cube([square_plate_side, square_plate_side, square_plate_thickness], center = true);
        translate([0, 0, square_plate_thickness / 2])
            cylinder(h = square_plate_thickness + 1, d = hole_diameter, center = true);
    }
}

// Assemble the model
module assembly() {
    // Layer 1: Square plate with a hole
    translate([0, 0, layer_offset + square_plate_thickness / 2])
        square_plate_with_hole();

    // Layer 2: Rectangular flat plate
    translate([0, 0, rectangular_plate_thickness / 2])
        rectangular_flat_plate();
}

// Render the assembly
assembly();

