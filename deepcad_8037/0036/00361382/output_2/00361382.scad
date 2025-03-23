
// Base block
module base_block() {
    difference() {
        // Main rectangular block
        cube([60, 40, 20], center = false);
        // Adjusted slanted cut to match the original model
        translate([0, 0, 0])
            rotate([0, 45, 0]) // Adjusted angle back to 45 degrees
            cube([60, 40, 25], center = false); // Adjusted depth to match the original model
    }
}

// Inclined block
module inclined_block() {
    difference() {
        // Main block
        translate([20, 10, 20]) // Adjusted position to align with the original model
            cube([30, 20, 10], center = false);
        // Adjusted inclined surface
        translate([20, 10, 20]) // Adjusted position to align with the original model
            rotate([0, 45, 0]) // Adjusted angle back to 45 degrees
            cube([30, 20, 12], center = false); // Adjusted depth to match the original model
    }
}

// Small rectangular block
module small_rectangular_block() {
    // Adjusted position to fit snugly within the recess of the base block
    translate([30, 15, 25]) // Lowered and repositioned to align with the original model
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

