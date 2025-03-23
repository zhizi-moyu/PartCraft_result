
// Function to create an L-shaped bracket
module l_shaped_bracket() {
    difference() {
        union() {
            // Two rectangular arms forming the L-shape
            cube([20, 10, 5], center = false); // Horizontal arm
            translate([0, 0, 5])
                cube([10, 20, 5], center = false); // Vertical arm
        }
        // Circular holes in each arm
        translate([10, 5, 2.5])
            rotate([90, 0, 0])
                cylinder(r = 2, h = 10, center = true);
        translate([5, 15, 7.5])
            rotate([90, 0, 0])
                cylinder(r = 2, h = 10, center = true);
        // Triangular cutout at the inner corner
        translate([0, 0, 5])
            polyhedron(
                points = [[0, 0, 0], [10, 0, 0], [0, 10, 0], [0, 0, 5]],
                faces = [[0, 1, 2], [0, 1, 3], [0, 2, 3], [1, 2, 3]]
            );
    }
}

// Function to create a C-shaped clamp
module c_shaped_clamp() {
    difference() {
        // Rectangular body
        cube([20, 10, 10], center = false);
        // Circular cutout in the center
        translate([10, 5, 5])
            rotate([90, 0, 0])
                cylinder(r = 5, h = 20, center = true);
        // Circular hole for fastening
        translate([5, 5, 5])
            rotate([90, 0, 0])
                cylinder(r = 2, h = 10, center = true);
    }
}

// Assembly of the model
module assembly() {
    // Layer 1: Two C-shaped clamps
    translate([0, 0, 20])
        c_shaped_clamp();
    translate([30, 0, 20])
        c_shaped_clamp();

    // Layer 2: Two L-shaped brackets
    translate([0, 0, 0])
        l_shaped_bracket();
    translate([30, 0, 0])
        l_shaped_bracket();
}

// Render the assembly
assembly();

