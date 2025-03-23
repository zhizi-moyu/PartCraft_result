
// Function to create a single central block
module central_block() {
    difference() {
        // Main rectangular block
        cube([20, 10, 5], center = true);
        
        // Protruding rectangular extensions
        translate([-15, 0, 0]) cube([10, 10, 5], center = true);
        translate([15, 0, 0]) cube([10, 10, 5], center = true);
        
        // Central cylindrical hole
        cylinder(h = 5, r = 5, center = true);
    }
}

// Arrange six central blocks in a uniform layer
module layer_1() {
    for (i = [0:5]) {
        rotate([0, 0, i * 60]) translate([30, 0, 0]) central_block();
    }
}

// Generate the 3D model
layer_1();

