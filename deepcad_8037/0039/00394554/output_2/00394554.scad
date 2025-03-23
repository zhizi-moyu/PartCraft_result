
// Define parameters for components
hollow_cylindrical_body_diameter = 40;
hollow_cylindrical_body_height = 50;
hollow_cylindrical_body_inner_diameter = 20; // Adjusted to ensure uniform inner cavity

solid_cylindrical_body_diameter = 40;
solid_cylindrical_body_height = 50;

spacer_ring_outer_diameter = 40;
spacer_ring_inner_diameter = 30;
spacer_ring_thickness = 2; // Reduced thickness to match original model

flange_plate_outer_diameter = 55; // Increased outer diameter to match original model
flange_plate_inner_diameter = 30;
flange_plate_thickness = 5;

bolt_diameter = 5;
bolt_length = 70; // Extended length to match original model
bolt_head_diameter = 8; // Increased head diameter to match original model
bolt_threaded_length = 60; // Extended threaded section

nut_diameter = 10;
nut_thickness = 5;

// Hollow cylindrical body
module hollow_cylindrical_body() {
    difference() {
        cylinder(h = hollow_cylindrical_body_height, d = hollow_cylindrical_body_diameter);
        translate([0, 0, -1]) // Ensure inner cavity runs through
            cylinder(h = hollow_cylindrical_body_height + 2, d = hollow_cylindrical_body_inner_diameter);
    }
}

// Solid cylindrical body
module solid_cylindrical_body() {
    cylinder(h = solid_cylindrical_body_height, d = solid_cylindrical_body_diameter);
}

// Spacer ring
module spacer_ring() {
    difference() {
        cylinder(h = spacer_ring_thickness, d = spacer_ring_outer_diameter);
        translate([0, 0, -1]) // Ensure hollow center
            cylinder(h = spacer_ring_thickness + 2, d = spacer_ring_inner_diameter);
    }
}

// Flange plate
module flange_plate() {
    difference() {
        cylinder(h = flange_plate_thickness, d = flange_plate_outer_diameter);
        translate([0, 0, -1]) // Ensure hollow center
            cylinder(h = flange_plate_thickness + 2, d = flange_plate_inner_diameter);
    }
}

// Bolt
module bolt() {
    union() {
        cylinder(h = bolt_threaded_length, d = bolt_diameter); // Threaded section
        translate([0, 0, bolt_threaded_length])
            cylinder(h = bolt_length - bolt_threaded_length, d = bolt_head_diameter); // Bolt head
    }
}

// Nut
module nut() {
    difference() {
        cylinder(h = nut_thickness, d = nut_diameter);
        translate([0, 0, -1]) // Ensure threaded cavity
            cylinder(h = nut_thickness + 2, d = bolt_diameter);
    }
}

// Assemble the model
translate([0, 0, 0]) hollow_cylindrical_body(); // Layer 1
translate([0, 0, -hollow_cylindrical_body_height]) solid_cylindrical_body(); // Layer 2
translate([0, 0, -hollow_cylindrical_body_height - solid_cylindrical_body_height]) spacer_ring(); // Layer 3
translate([0, 0, -hollow_cylindrical_body_height - solid_cylindrical_body_height - spacer_ring_thickness]) flange_plate(); // Layer 4
translate([0, 0, -hollow_cylindrical_body_height - solid_cylindrical_body_height - spacer_ring_thickness - flange_plate_thickness]) flange_plate(); // Layer 5
translate([0, 0, -hollow_cylindrical_body_height - solid_cylindrical_body_height - spacer_ring_thickness - flange_plate_thickness * 2]) spacer_ring(); // Layer 6
translate([0, 0, -hollow_cylindrical_body_height - solid_cylindrical_body_height - spacer_ring_thickness - flange_plate_thickness * 2 - spacer_ring_thickness]) solid_cylindrical_body(); // Layer 7
translate([0, 0, -hollow_cylindrical_body_height - solid_cylindrical_body_height - spacer_ring_thickness - flange_plate_thickness * 2 - spacer_ring_thickness - solid_cylindrical_body_height]) hollow_cylindrical_body(); // Layer 8

