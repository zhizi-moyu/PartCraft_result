
// Base block
module base_block() {
    difference() {
        // Main rectangular block
        cube([60, 40, 20], center = false);
        // Slanted cut
        translate([0, 0, 0])
            rotate([0, 45, 0])
            cube([60, 40, 20], center = false);
    }
}

// Inclined block
module inclined_block() {
    difference() {
        // Main block
        translate([20, 10, 20])
            cube([30, 20, 10], center = false);
        // Inclined surface
        translate([20, 10, 20])
            rotate([0, 45, 0])
            cube([30, 20, 10], center = false);
    }
}

// Small rectangular block
module small_rectangular_block() {
    translate([30, 15, 30])
        cube([10, 10, 10], center = false);
}

// Assembly
module assembly() {
    base_block();
    inclined_block();
    small_rectangular_block();
}

// Render the assembly
assembly();

