
// Parameters for the U-shaped block
module u_shaped_block() {
    difference() {
        // Outer block
        cube([20, 20, 10], center = true);
        // Inner cutout
        translate([0, 0, -5]) {
            cube([10, 10, 10], center = true);
        }
    }
}

// Arrange the U-shaped blocks in a uniform layer
module layer_1() {
    for (i = [0:5]) {
        rotate([0, 0, i * 60]) {
            translate([30, 0, 0]) {
                u_shaped_block();
            }
        }
    }
}

// Main model
layer_1();

