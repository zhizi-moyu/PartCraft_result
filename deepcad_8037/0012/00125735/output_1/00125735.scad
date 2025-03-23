
// Base block
module base_block() {
    // Removed the protrusions to restore a flat and uniform surface
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
    // Reoriented the triangular support so its slanted side faces outward
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
    // Repositioned the L-shaped connector lower and detached from the base block
    translate([0, 0, 10])
        l_shaped_connector();

    // Layer 3: Triangular support
    // Adjusted the position and orientation of the triangular support
    translate([0, 0, 25])
        rotate([0, 0, 180]) // Rotate to ensure slanted side faces outward
        triangular_support();
}

// Render the assembly
assembly();

