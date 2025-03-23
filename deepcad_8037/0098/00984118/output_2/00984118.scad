
// Parameters
shaft_diameter = 24; // Updated: Diameter of shafts (increased for input shaft)
shaft_length = 70; // Updated: Length of input/output shafts (increased for output shaft)
central_shaft_length = 90; // Updated: Length of central shaft (elongated)
flange_diameter = 40; // Diameter of flange plates
flange_thickness = 5; // Thickness of flange plates
spacer_ring_diameter = 40; // Diameter of spacer rings
spacer_ring_thickness = 1; // Updated: Thickness of spacer rings (reduced)
bolt_diameter = 6; // Updated: Diameter of bolts (increased)
bolt_length = 80; // Updated: Length of bolts (lengthened)
nut_diameter = 6; // Updated: Diameter of nuts (reduced)
nut_thickness = 2.5; // Updated: Thickness of nuts (reduced)
hole_spacing = 30; // Distance between bolt holes in flange plates
additional_holes = 6; // Updated: Number of additional bolt holes in flange plates

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
module shaft(length, hollow_depth = 0) {
    difference() {
        cylinder(h = length, d = shaft_diameter);
        if (hollow_depth > 0) {
            translate([0, 0, length - hollow_depth])
            cylinder(h = hollow_depth, d = shaft_diameter / 2);
        }
    }
}

// Assembly
translate([0, 0, shaft_length])
shaft(shaft_length, hollow_depth = 20); // Input shaft with hollow center

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
shaft(shaft_length, hollow_depth = 25); // Output shaft with deeper hollow center

// Bolts and nuts
for (i = [0:(additional_holes - 1)]) {
    rotate([0, 0, i * (360 / additional_holes)])
    translate([hole_spacing / 2, 0, shaft_length + flange_thickness + spacer_ring_thickness / 2])
    bolt(); // Bolts
    translate([0, 0, -nut_thickness])
    nut(); // Nuts
}

