
// Base block
module base_block() {
    difference() {
        cube([40, 40, 20]); // Main block
        translate([10, 10, 0]) cube([20, 20, 10]); // Step cutout
    }
}

// Middle block
module middle_block() {
    difference() {
        cube([40, 40, 20]); // Main block
        translate([10, 10, 0]) cube([20, 20, 10]); // Bottom step cutout
        translate([10, 10, 10]) cube([20, 20, 10]); // Top step cutout
    }
}

// Top block
module top_block() {
    difference() {
        cube([40, 40, 20]); // Main block
        translate([10, 10, 10]) cube([20, 20, 10]); // Step cutout
    }
}

// Assemble the model
module flexible_coupling() {
    translate([0, 0, 0]) base_block(); // Layer 3: Base block
    translate([0, 0, 20]) middle_block(); // Layer 2: Middle block
    translate([0, 0, 40]) top_block(); // Layer 1: Top block
}

// Render the model
flexible_coupling();

