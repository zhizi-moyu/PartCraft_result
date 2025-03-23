
// Parameters
shaft_diameter = 22; // Updated: Diameter of shafts (increased for input shaft)
shaft_length = 60; // Updated: Length of input/output shafts (increased for output shaft)
central_shaft_length = 80; // Updated: Length of central shaft (elongated)
flange_diameter = 40; // Diameter of flange plates
flange_thickness = 5; // Thickness of flange plates
spacer_ring_diameter = 40; // Diameter of spacer rings
spacer_ring_thickness = 1.5; // Updated: Thickness of spacer rings (reduced)
bolt_diameter = 5; // Diameter of bolts
bolt_length = 70; // Updated: Length of bolts (lengthened)
nut_diameter = 7; // Updated: Diameter of nuts (reduced)
nut_thickness = 3; // Updated: Thickness of nuts (reduced)
hole_spacing = 30; // Distance between bolt holes in flange plates
additional_holes = 4; // Updated: Number of additional bolt holes in flange plates

// Helper function to create a bolt
module bolt() {
    cylinder(h = bolt_length, d = bolt_diameter);
}

// Helper function to create a nut
module nut() {
    cylinder(h = nut_thickness, d = nut_diameter);
}

// Helper function to create a flange plate
module flange_plate() {
    difference() {
        cylinder(h = flange_thickness, d = flange_diameter);
        for (i = [0:(additional_holes - 1)]) {
            rotate([0, 0, i * (360 / additional_holes)])
            translate([hole_spacing / 2, 0, 0])
            cylinder(h = flange_thickness + 1, d = bolt_diameter + 2);
        }
    }
}

// Helper function to create a spacer ring
module spacer_ring() {
    difference() {
        cylinder(h = spacer_ring_thickness, d = spacer_ring_diameter);
        cylinder(h = spacer_ring_thickness + 1, d = shaft_diameter);
    }
}

// Helper function to create a shaft
module shaft(length) {
    cylinder(h = length, d = shaft_diameter);
}

// Assembly
translate([0, 0, shaft_length])
shaft(shaft_length); // Input shaft

translate([0, 0, shaft_length + flange_thickness])
flange_plate(); // Flange plate 1

translate([0, 0, shaft_length + flange_thickness + spacer_ring_thickness])
spacer_ring(); // Spacer ring 1

translate([0, 0, shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness])
flange_plate(); // Flange plate 2

translate([0, 0, shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness + central_shaft_length])
shaft(central_shaft_length); // Central shaft

translate([0, 0, shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness + central_shaft_length + flange_thickness])
flange_plate(); // Flange plate 3

translate([0, 0, shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness + central_shaft_length + flange_thickness + spacer_ring_thickness])
spacer_ring(); // Spacer ring 2

translate([0, 0, shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness + central_shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness])
flange_plate(); // Flange plate 4

translate([0, 0, shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness + central_shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness + shaft_length])
shaft(shaft_length); // Output shaft

// Bolts and nuts
for (i = [0:(additional_holes - 1)]) {
    rotate([0, 0, i * (360 / additional_holes)])
    translate([hole_spacing / 2, 0, shaft_length + flange_thickness + spacer_ring_thickness / 2])
    bolt(); // Bolts
    translate([0, 0, -nut_thickness])
    nut(); // Nuts
}

