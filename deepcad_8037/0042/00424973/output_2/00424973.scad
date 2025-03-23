
// Define dimensions for each component
module central_block() {
    // Adjusted to remove the extra recessed step and match the symmetrical two-level structure
    difference() {
        cube([40, 20, 10], center = true);
        translate([0, 0, 5])
            cube([30, 20, 5], center = true);
    }
}

module side_block() {
    // Adjusted to reduce the depth of the recessed step
    difference() {
        cube([40, 20, 10], center = true);
        translate([15, 0, 8]) // Reduced depth of the recessed step
            cube([10, 20, 2], center = true);
    }
}

module spacer_block() {
    // Adjusted to reduce the size of the stepped profile
    difference() {
        cube([20, 10, 5], center = true);
        translate([0, 0, 2.5])
            cube([18, 10, 2.5], center = true); // Reduced size of the stepped profile
    }
}

module end_block() {
    // Adjusted to remove the protrusion and make the block flat and symmetrical
    cube([20, 10, 5], center = true);
}

// Assemble the components based on the positional relationship
module assembly() {
    translate([0, 0, 15]) end_block(); // Layer 1
    translate([0, 0, 10]) spacer_block(); // Layer 2
    translate([0, 0, 0]) central_block(); // Layer 3
    translate([0, 0, -10]) side_block(); // Layer 4
}

// Render the assembly
assembly();

