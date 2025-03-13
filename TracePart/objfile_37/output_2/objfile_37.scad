
// Parameters
module input_craft() {
    difference() {
        cylinder(h = 10, r = 15, $fn = 100);
        translate([0, 0, -1]) cylinder(h = 12, r = 5, $fn = 100);

        // Add grooves and side cuts
        for (i = [0:90:270]) {
            rotate([0, 0, i]) translate([10, 0, 5]) cube([5, 2, 10], center = true);
        }
        translate([0, 0, 5]) rotate([90, 0, 0]) cylinder(h = 10, r = 1.5, $fn = 100);
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = 5, r = 15, $fn = 100);
        translate([0, 0, -1]) cylinder(h = 7, r = 10, $fn = 100);

        // Add vertical cuts and additional holes
        for (i = [0:90:270]) {
            rotate([0, 0, i]) translate([10, 0, 2.5]) cube([5, 2, 5], center = true);
        }
        for (i = [0:120:240]) {
            rotate([0, 0, i]) translate([7, 0, 2.5]) rotate([90, 0, 0]) cylinder(h = 5, r = 1, $fn = 100);
        }
    }
}

module clamp_screw() {
    translate([0, 12, 2.5]) rotate([90, 0, 0]) cylinder(h = 5, r = 1.5, $fn = 100);
}

module output_craft() {
    difference() {
        cylinder(h = 10, r = 15, $fn = 100);
        translate([0, 0, -1]) cylinder(h = 12, r = 5, $fn = 100);

        // Add multiple holes and grooves
        for (i = [0:90:270]) {
            rotate([0, 0, i]) translate([10, 0, 5]) cube([5, 2, 10], center = true);
        }
        for (i = [0:120:240]) {
            rotate([0, 0, i]) translate([7, 0, 5]) rotate([90, 0, 0]) cylinder(h = 10, r = 1, $fn = 100);
        }
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

