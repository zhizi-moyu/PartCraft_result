
// Base block
module base_block() {
    // Ensure the base block has a flat and uniform surface
    cube([20, 20, 10], center = true);
}

// L-shaped connector
module l_shaped_connector() {
    // Adjusted to align symmetrically with the base block
    difference() {
        union() {
            cube([20, 10, 10], center = true);
            translate([5, 5, 5]) // Adjusted position for symmetry
                cube([10, 10, 20], center = true);
        }
        translate([5, 5, 0]) // Adjusted cutout position for alignment
            cube([10, 10, 10], center = true);
    }
}

// Triangular support
module triangular_support() {
    // Adjusted position and orientation to align with other components
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
    // Repositioned to align symmetrically with the base block
    translate([0, 0, 15]) // Adjusted height for proper alignment
        l_shaped_connector();

    // Layer 3: Triangular support
    // Adjusted position and orientation for seamless integration
    translate([0, 0, 25])
        rotate([0, 0, 0]) // Removed unnecessary rotation
        triangular_support();
}

// Render the assembly
assembly();

