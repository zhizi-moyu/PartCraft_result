
// Parameters for the U-shaped block
module u_shaped_block() {
    difference() {
        // Outer block with thicker horizontal base and extended vertical arms
        cube([20, 20, 20], center = true); // Adjusted height to make the base thicker
        // Inner cutout
        translate([0, 0, -10]) { // Adjusted position to match proportions
            cube([10, 10, 20], center = true); // Adjusted height to reduce the opening
        }
    }
}

// Arrange the U-shaped blocks in a compact linear configuration
module layer_1() {
    for (i = [0:5]) {
        translate([i * 22, 0, 0]) { // Adjusted spacing for tighter arrangement
            u_shaped_block();
        }
    }
}

// Main model
layer_1();

