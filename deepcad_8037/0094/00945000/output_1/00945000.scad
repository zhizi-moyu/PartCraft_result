// Parameters for components
module central_shaft(length = 90, diameter = 10) { // Reduced length to match original proportions
    cylinder(h = length, r = diameter / 2, $fn = 100);
}

module input_hub(diameter = 18, height = 15, hole_diameter = 8) { // Adjusted diameter and hole size
    difference() {
        cylinder(h = height, r = diameter / 2, $fn = 100);
        translate([0, 0, -1]) cylinder(h = height + 2, r = hole_diameter / 2, $fn = 100);
    }
}

module output_hub(diameter = 18, height = 15, hole_diameter = 8) { // Adjusted diameter and hole size
    difference() {
        cylinder(h = height, r = diameter / 2, $fn = 100);
        translate([0, 0, -1]) cylinder(h = height + 2, r = hole_diameter / 2, $fn = 100);
    }
}

module spacer_ring(outer_diameter = 20, inner_diameter = 10, thickness = 1.5) { // Reduced thickness
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
            rotate([0, 0, i]) translate([outer_diameter / 2 - 6, 0, 0]) // Adjusted bolt hole positions
                cylinder(h = thickness + 2, r = bolt_hole_diameter / 2, $fn = 100);
        }
    }
}

module bolt(length = 25, diameter = 3) { // Shortened length
    cylinder(h = length, r = diameter / 2, $fn = 100);
}

module nut(diameter = 4, thickness = 2.5) { // Reduced size and streamlined shape
    cylinder(h = thickness, r = diameter / 2, $fn = 6);
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input Hub
    translate([0, 0, 0]) input_hub();

    // Layer 2: Flange Plate 1 with Nuts
    translate([0, 0, 15]) flange_plate();
    for (i = [0 : 90 : 270]) {
        rotate([0, 0, i]) translate([9, 0, 18]) nut(); // Adjusted nut positions
    }

    // Layer 3: Spacer Ring 1 with Bolts
    translate([0, 0, 18]) spacer_ring();
    for (i = [0 : 90 : 270]) {
        rotate([0, 0, i]) translate([9, 0, 18]) bolt(length = 25); // Adjusted bolt positions
    }

    // Layer 4: Flange Plate 2 with Nuts
    translate([0, 0, 20]) flange_plate();
    for (i = [0 : 90 : 270]) {
        rotate([0, 0, i]) translate([9, 0, 23]) nut(); // Adjusted nut positions
    }

    // Layer 5: Central Shaft
    translate([0, 0, 23]) central_shaft();

    // Layer 6: Flange Plate 3 with Nuts
    translate([0, 0, 113]) flange_plate(); // Adjusted position to match shorter shaft
    for (i = [0 : 90 : 270]) {
        rotate([0, 0, i]) translate([9, 0, 116]) nut(); // Adjusted nut positions
    }

    // Layer 7: Spacer Ring 2 with Bolts
    translate([0, 0, 116]) spacer_ring();
    for (i = [0 : 90 : 270]) {
        rotate([0, 0, i]) translate([9, 0, 116]) bolt(length = 25); // Adjusted bolt positions
    }

    // Layer 8: Flange Plate 4 with Nuts
    translate([0, 0, 118]) flange_plate();
    for (i = [0 : 90 : 270]) {
        rotate([0, 0, i]) translate([9, 0, 121]) nut(); // Adjusted nut positions
    }

    // Layer 9: Output Hub
    translate([0, 0, 121]) output_hub(); // Adjusted position to match shorter shaft
}

// Render the flexible coupling
flexible_coupling();
