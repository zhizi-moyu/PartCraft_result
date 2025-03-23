
// Define the central block
module central_block() {
    difference() {
        cube([20, 20, 20], center = true);
        union() {
            // Deepen and refine the cross-shaped void
            translate([-10, -5, -20]) cube([20, 10, 40], center = true); // Adjusted depth to extend fully through
            translate([-5, -10, -20]) cube([10, 20, 40], center = true); // Adjusted depth to extend fully through
        }
    }
}

// Define the upper block
module upper_block() {
    difference() {
        cube([20, 20, 10], center = true);
        // Enlarge and sharpen the stepped cutout
        translate([-10, -5, -10]) cube([20, 10, 20], center = true); // Adjusted dimensions for precision
        translate([-5, -10, -10]) cube([10, 20, 20], center = true); // Added for better alignment
    }
}

// Define the lower block
module lower_block() {
    difference() {
        cube([20, 20, 10], center = true);
        // Mirror the upper block’s cutout and ensure proper alignment
        translate([-10, -5, 0]) cube([20, 10, 20], center = true); // Adjusted dimensions for precision
        translate([-5, -10, 0]) cube([10, 20, 20], center = true); // Added for better alignment
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

