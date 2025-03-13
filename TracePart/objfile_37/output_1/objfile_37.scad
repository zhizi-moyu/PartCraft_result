
// Parameters
module input_craft() {
    difference() {
        cylinder(h = 10, r = 15, $fn = 100);
        translate([0, 0, -1]) cylinder(h = 12, r = 5, $fn = 100);
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 5, r = 15, $fn = 100);
        translate([0, 0, -1]) cylinder(h = 7, r = 10, $fn = 100);
    }
}

module clamp_screw() {
    translate([0, 12, 2.5]) rotate([90, 0, 0]) cylinder(h = 5, r = 1.5, $fn = 100);
}

module output_craft() {
    difference() {
        cylinder(h = 10, r = 15, $fn = 100);
        translate([0, 0, -1]) cylinder(h = 12, r = 5, $fn = 100);
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input Craft
    input_craft();

    // Layer 2: Spacer Ring
    translate([0, 0, 10]) spacer_ring();

    // Layer 3: Clamp Screws
    translate([0, 0, 10]) {
        clamp_screw();
        rotate([0, 0, 180]) clamp_screw();
    }

    // Layer 4: Output Craft
    translate([0, 0, 15]) output_craft();
}

// Render the model
flexible_coupling();

