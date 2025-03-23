
// Define the wedge block
module wedge_block() {
    difference() {
        // Base block
        linear_extrude(height = 10)
            polygon(points = [[0, 0], [20, 0], [20, 10], [0, 5]]);
        // Cutout to create the slanted top
        translate([0, 0, 5])
            linear_extrude(height = 10)
                polygon(points = [[0, 0], [20, 0], [20, 10]]);
    }
}

// Define the hollow triangular prism
module hollow_triangular_prism() {
    difference() {
        // Outer triangular prism
        linear_extrude(height = 10)
            polygon(points = [[0, 0], [20, 0], [10, 10]]);
        // Inner triangular cutout
        translate([2, 2, 0])
            linear_extrude(height = 10)
                polygon(points = [[0, 0], [16, 0], [8, 8]]);
    }
}

// Define the solid triangular prism
module solid_triangular_prism() {
    linear_extrude(height = 10)
        polygon(points = [[0, 0], [20, 0], [10, 10]]);
}

// Assemble the model
module flexible_coupling() {
    // Layer 3: Wedge block
    translate([0, 0, 0])
        wedge_block();
    // Layer 2: Hollow triangular prism
    translate([0, 0, 10])
        hollow_triangular_prism();
    // Layer 1: Solid triangular prism
    translate([0, 0, 20])
        solid_triangular_prism();
}

// Render the model
flexible_coupling();

