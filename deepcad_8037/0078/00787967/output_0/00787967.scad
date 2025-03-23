
// Parameters for the square plate with a hole
plate_width = 50; // Width of the square plate
plate_thickness = 5; // Thickness of the plate
hole_diameter = 20; // Diameter of the central hole
layer_spacing = 5; // Spacing between layers

// Function to create a square plate with a central hole
module square_plate_with_hole() {
    difference() {
        cube([plate_width, plate_width, plate_thickness], center = true);
        translate([0, 0, -plate_thickness / 2])
            cylinder(h = plate_thickness * 2, d = hole_diameter, center = true);
    }
}

// Assembling the layers based on the graph_dict
module assemble_model() {
    for (i = [0:5]) {
        translate([0, 0, -i * (plate_thickness + layer_spacing)])
            square_plate_with_hole();
    }
}

// Call the assembly module to generate the model
assemble_model();

