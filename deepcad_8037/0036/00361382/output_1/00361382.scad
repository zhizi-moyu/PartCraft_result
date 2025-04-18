
// Base block
module base_block() {
    difference() {
        // Main rectangular block
        cube([60, 40, 20], center = false);
        // Adjusted slanted cut for a steeper inclined surface
        translate([0, 0, 0])
            rotate([0, 60, 0]) // Adjusted angle from 45 to 60 degrees
            cube([60, 40, 30], center = false); // Increased depth to match original model
    }
}

// Inclined block
module inclined_block() {
    difference() {
        // Main block
        translate([18, 8, 20]) // Adjusted position to align with the original model
            cube([30, 20, 10], center = false);
        // Adjusted inclined surface
        translate([18, 8, 20]) // Adjusted position to align with the original model
            rotate([0, 30, 0]) // Adjusted angle from 45 to 30 degrees
            cube([30, 20, 15], center = false); // Increased depth to match original model
    }
}

// Small rectangular block
module small_rectangular_block() {
    // Adjusted position to fit snugly within the recess of the base block
    translate([32, 18, 30]) // Adjusted position to align with the original model
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

