
// Parameters
plate_length = 100; // Length of the flat plate
plate_width = 80;   // Width of the flat plate
plate_thickness = 2; // Thickness of the flat plate
hole_diameter = 5;  // Diameter of the corner holes
bolt_diameter = 4;  // Diameter of the bolts
bolt_length = 15;   // Shortened length of the bolts
nut_thickness = 4;  // Thickness of the nuts
nut_diameter = 8;   // Diameter of the nuts
layer_spacing = 8;  // Reduced spacing between layers

// Function to create a flat plate with corner holes
module flat_plate() {
    difference() {
        cube([plate_length, plate_width, plate_thickness], center = true);
        for (x = [-plate_length/2 + 10, plate_length/2 - 10])
            for (y = [-plate_width/2 + 10, plate_width/2 - 10])
                translate([x, y, 0])
                    cylinder(h = plate_thickness + 1, d = hole_diameter, center = true);
    }
}

// Function to create a bolt
module bolt() {
    cylinder(h = bolt_length, d = bolt_diameter, center = true);
}

// Function to create a nut
module nut() {
    difference() {
        cylinder(h = nut_thickness, d = nut_diameter, center = true);
        cylinder(h = nut_thickness + 1, d = bolt_diameter, center = true);
    }
}

// Function to assemble a single layer
module layer(z_offset) {
    translate([0, 0, z_offset])
        flat_plate();
    for (x = [-plate_length/2 + 10, plate_length/2 - 10])
        for (y = [-plate_width/2 + 10, plate_width/2 - 10]) {
            translate([x, y, z_offset - bolt_length/2])
                bolt();
            translate([x, y, z_offset - bolt_length - nut_thickness/2])
                nut();
        }
}

// Assemble all layers
for (i = [0:5]) {
    layer(i * (plate_thickness + layer_spacing));
}

