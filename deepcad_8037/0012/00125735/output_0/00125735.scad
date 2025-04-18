
// Base block
module base_block() {
    cube([20, 20, 10], center = true);
}

// L-shaped connector
module l_shaped_connector() {
    difference() {
        union() {
            cube([20, 10, 10], center = true);
            translate([0, 5, 5])
                cube([10, 10, 20], center = true);
        }
        translate([0, 0, 0])
            cube([10, 10, 10], center = true);
    }
}

// Triangular support
module triangular_support() {
    polyhedron(
        points = [
            [0, 0, 0], [10, 0, 0], [0, 10, 0], // Base vertices
            [0, 0, 10]                        // Apex vertex
        ],
        faces = [
            [0, 1, 2], [0, 1, 3], [1, 2, 3], [2, 0, 3]
        ]
    );
}

// Assembly
module assembly() {
    // Layer 1: Base block
    translate([0, 0, 5])
        base_block();

    // Layer 2: L-shaped connector
    translate([0, 0, 15])
        l_shaped_connector();

    // Layer 3: Triangular support
    translate([0, 0, 30])
        triangular_support();
}

// Render the assembly
assembly();

