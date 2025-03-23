
// Parameters for the U-shaped block
module u_shaped_block() {
    difference() {
        // Outer block with thicker horizontal base and extended vertical arms
        cube([20, 20, 15], center = true);
        // Inner cutout
        translate([0, 0, -7.5]) {
            cube([10, 10, 15], center = true);
        }
    }
}

// Arrange the U-shaped blocks in a linear configuration
module layer_1() {
    for (i = [0:5]) {
        translate([i * 25, 0, 0]) { // Linear arrangement
            u_shaped_block();
        }
    }
}

// Main model
layer_1();

