
// Define the central block
module central_block() {
    difference() {
        cube([20, 20, 20], center = true);
        union() {
            // Deepen and refine the cross-shaped void
            translate([-10, -5, -15]) cube([20, 10, 30], center = true);
            translate([-5, -10, -15]) cube([10, 20, 30], center = true);
        }
    }
}

// Define the upper block
module upper_block() {
    difference() {
        cube([20, 20, 10], center = true);
        // Enlarge and sharpen the stepped cutout
        translate([-10, -5, -10]) cube([20, 10, 15], center = true);
    }
}

// Define the lower block
module lower_block() {
    difference() {
        cube([20, 20, 10], center = true);
        // Enlarge and sharpen the stepped cutout
        translate([-10, -5, 0]) cube([20, 10, 15], center = true);
    }
}

// Assemble the components
module assembly() {
    translate([0, 0, 15]) upper_block(); // Position the upper block
    central_block(); // Position the central block
    translate([0, 0, -15]) lower_block(); // Position the lower block
}

// Render the assembly
assembly();

