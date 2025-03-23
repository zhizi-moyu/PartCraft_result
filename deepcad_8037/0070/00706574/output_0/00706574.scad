
// Function to create a single wedge block
module wedge_block() {
    polyhedron(
        points=[
            [0, 0, 0],  // Bottom-left corner of the base
            [20, 0, 0], // Bottom-right corner of the base
            [20, 10, 0], // Top-right corner of the base
            [0, 10, 0],  // Top-left corner of the base
            [10, 5, 20]  // Apex point of the triangular prism
        ],
        faces=[
            [0, 1, 4], // Bottom slanted face
            [1, 2, 4], // Right slanted face
            [2, 3, 4], // Top slanted face
            [3, 0, 4], // Left slanted face
            [0, 1, 2, 3] // Base face
        ]
    );
}

// Function to arrange six wedge blocks in a circular pattern
module flexible_coupling() {
    for (i = [0:5]) {
        rotate([0, 0, i * 60]) // Rotate each block by 60 degrees
        translate([30, 0, 0]) // Position each block in a circular pattern
        wedge_block();
    }
}

// Generate the flexible coupling
flexible_coupling();

