
// Parameters for components
module central_shaft(length = 100, diameter = 10) {
    cylinder(h = length, r = diameter / 2, $fn = 100);
}

module input_hub(diameter = 20, height = 15, hole_diameter = 10) {
    difference() {
        cylinder(h = height, r = diameter / 2, $fn = 100);
        translate([0, 0, -1]) cylinder(h = height + 2, r = hole_diameter / 2, $fn = 100);
    }
}

module output_hub(diameter = 20, height = 15, hole_diameter = 10) {
    difference() {
        cylinder(h = height, r = diameter / 2, $fn = 100);
        translate([0, 0, -1]) cylinder(h = height + 2, r = hole_diameter / 2, $fn = 100);
    }
}

module spacer_ring(outer_diameter = 20, inner_diameter = 10, thickness = 2) {
    difference() {
        cylinder(h = thickness, r = outer_diameter / 2, $fn = 100);
        translate([0, 0, -1]) cylinder(h = thickness + 2, r = inner_diameter / 2, $fn = 100);
    }
}

module flange_plate(outer_diameter = 25, inner_diameter = 10, thickness = 3, bolt_hole_diameter = 3, num_bolt_holes = 4) {
    difference() {
        cylinder(h = thickness, r = outer_diameter / 2, $fn = 100);
        translate([0, 0, -1]) cylinder(h = thickness + 2, r = inner_diameter / 2, $fn = 100);
        for (i = [0 : 360 / num_bolt_holes : 360 - 360 / num_bolt_holes]) {
            rotate([0, 0, i]) translate([outer_diameter / 2 - 5, 0, 0])
                cylinder(h = thickness + 2, r = bolt_hole_diameter / 2, $fn = 100);
        }
    }
}

module bolt(length = 20, diameter = 3) {
    cylinder(h = length, r = diameter / 2, $fn = 100);
}

module nut(diameter = 5, thickness = 3) {
    cylinder(h = thickness, r = diameter / 2, $fn = 6);
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input Hub
    translate([0, 0, 0]) input_hub();

    // Layer 2: Flange Plate 1 with Nuts
    translate([0, 0, 15]) flange_plate();
    for (i = [0 : 90 : 270]) {
        rotate([0, 0, i]) translate([10, 0, 18]) nut();
    }

    // Layer 3: Spacer Ring 1 with Bolts
    translate([0, 0, 18]) spacer_ring();
    for (i = [0 : 90 : 270]) {
        rotate([0, 0, i]) translate([10, 0, 18]) bolt(length = 30);
    }

    // Layer 4: Flange Plate 2 with Nuts
    translate([0, 0, 20]) flange_plate();
    for (i = [0 : 90 : 270]) {
        rotate([0, 0, i]) translate([10, 0, 23]) nut();
    }

    // Layer 5: Central Shaft
    translate([0, 0, 23]) central_shaft();

    // Layer 6: Flange Plate 3 with Nuts
    translate([0, 0, 123]) flange_plate();
    for (i = [0 : 90 : 270]) {
        rotate([0, 0, i]) translate([10, 0, 126]) nut();
    }

    // Layer 7: Spacer Ring 2 with Bolts
    translate([0, 0, 126]) spacer_ring();
    for (i = [0 : 90 : 270]) {
        rotate([0, 0, i]) translate([10, 0, 126]) bolt(length = 30);
    }

    // Layer 8: Flange Plate 4 with Nuts
    translate([0, 0, 128]) flange_plate();
    for (i = [0 : 90 : 270]) {
        rotate([0, 0, i]) translate([10, 0, 131]) nut();
    }

    // Layer 9: Output Hub
    translate([0, 0, 131]) output_hub();
}

// Render the flexible coupling
flexible_coupling();

