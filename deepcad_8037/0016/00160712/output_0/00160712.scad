
// Define the central block
module central_block() {
    difference() {
        cube([20, 20, 20], center = true);
        union() {
            translate([-10, -5, -10]) cube([20, 10, 20], center = true);
            translate([-5, -10, -10]) cube([10, 20, 20], center = true);
        }
    }
}

// Define the upper block
module upper_block() {
    difference() {
        cube([20, 20, 10], center = true);
        translate([-10, -5, -10]) cube([20, 10, 10], center = true);
    }
}

// Define the lower block
module lower_block() {
    difference() {
        cube([20, 20, 10], center = true);
        translate([-10, -5, 0]) cube([20, 10, 10], center = true);
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

