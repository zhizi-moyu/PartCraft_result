
// Parameters for dimensions
central_craft_diameter = 30;
central_craft_length = 35; // Reduced length to match original model proportions

input_craft_diameter = 18; // Reduced diameter to match original model
input_craft_length = 35; // Increased length to match original model

output_craft_diameter = 18; // Reduced diameter to match original model
output_craft_length = 35; // Increased length to match original model

spacer_ring_outer_diameter = 30;
spacer_ring_inner_diameter = 25;
spacer_ring_thickness = 1.5; // Reduced thickness to match original model

flange_plate_outer_diameter = 40;
flange_plate_inner_diameter = 25;
flange_plate_thickness = 5;
bolt_hole_diameter = 5;
bolt_hole_count = 8; // Increased bolt hole count to match original model

bolt_diameter = 5;
bolt_length = 60; // Increased length to match original model

nut_diameter = 8; // Reduced diameter to match original model
nut_thickness = 4; // Reduced thickness to match original model

// Central Craft
module central_craft() {
    cylinder(d = central_craft_diameter, h = central_craft_length, $fn = 100); // Smooth cylindrical surface
}

// Input Craft
module input_craft() {
    cylinder(d = input_craft_diameter, h = input_craft_length, $fn = 100); // Uniformly cylindrical
}

// Output Craft
module output_craft() {
    cylinder(d = output_craft_diameter, h = output_craft_length, $fn = 100); // Uniformly cylindrical
}

// Spacer Ring
module spacer_ring() {
    difference() {
        cylinder(d = spacer_ring_outer_diameter, h = spacer_ring_thickness, $fn = 100);
        translate([0, 0, -1]) cylinder(d = spacer_ring_inner_diameter, h = spacer_ring_thickness + 2, $fn = 100);
    }
}

// Flange Plate
module flange_plate() {
    difference() {
        cylinder(d = flange_plate_outer_diameter, h = flange_plate_thickness, $fn = 100);
        translate([0, 0, -1]) cylinder(d = flange_plate_inner_diameter, h = flange_plate_thickness + 2, $fn = 100);
        for (i = [0:bolt_hole_count-1]) {
            rotate([0, 0, i * 360 / bolt_hole_count])
            translate([flange_plate_outer_diameter / 2 - 5, 0, -1])
            cylinder(d = bolt_hole_diameter, h = flange_plate_thickness + 2, $fn = 100);
        }
    }
}

// Bolt
module bolt() {
    cylinder(d = bolt_diameter, h = bolt_length, $fn = 100); // Slender and cylindrical
}

// Nut
module nut() {
    difference() {
        cylinder(d = nut_diameter, h = nut_thickness, $fn = 6); // Hexagonal shape
        translate([0, 0, -1]) cylinder(d = bolt_diameter, h = nut_thickness + 2, $fn = 100);
    }
}

// Assembly
module assembly() {
    translate([0, 0, 0]) central_craft();
    translate([0, 0, -input_craft_length]) input_craft();
    translate([0, 0, central_craft_length]) output_craft();
    translate([0, 0, -input_craft_length - spacer_ring_thickness]) spacer_ring();
    translate([0, 0, central_craft_length + spacer_ring_thickness]) spacer_ring();
    translate([0, 0, -input_craft_length - spacer_ring_thickness - flange_plate_thickness]) flange_plate();
    translate([0, 0, central_craft_length + spacer_ring_thickness + flange_plate_thickness]) flange_plate();
    for (i = [0:bolt_hole_count-1]) {
        rotate([0, 0, i * 360 / bolt_hole_count])
        translate([flange_plate_outer_diameter / 2 - 5, 0, -input_craft_length - spacer_ring_thickness - flange_plate_thickness - bolt_length])
        bolt();
        translate([flange_plate_outer_diameter / 2 - 5, 0, central_craft_length + spacer_ring_thickness + flange_plate_thickness])
        nut();
    }
}

// Render the assembly
assembly();

