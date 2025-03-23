// Base block
module base_block() {
    translate([0, 0, 5]) // Adjust position to align flat
    cube([50, 30, 10], center = true);
}

// Flat plate
module flat_plate() {
    translate([0, 0, 15]) // Adjust position to align uniformly above the base block
    cube([50, 30, 2], center = true);
}

// Trapezoidal block
module trapezoidal_block() {
    translate([0, 0, 17]) // Adjust position to align above the flat plate
    rotate([0, 0, 0]) // Ensure proper orientation
    polyhedron(
        points = [
            [-25, -15, 0], [25, -15, 0], [20, 15, 0], [-20, 15, 0], // Bottom vertices
            [-25, -15, 10], [25, -15, 10], [20, 15, 10], [-20, 15, 10]  // Top vertices
        ],
        faces = [
            [0, 1, 5, 4], [1, 2, 6, 5], [2, 3, 7, 6], [3, 0, 4, 7], // Side faces
            [0, 1, 2, 3], [4, 5, 6, 7] // Top and bottom faces
        ]
    );
}

// Triangular prism
module triangular_prism() {
    translate([0, 0, 27]) // Adjust position to align above the trapezoidal block
    rotate([0, 0, 0]) // Ensure proper orientation
    polyhedron(
        points = [
            [-15, -10, 0], [15, -10, 0], [0, 10, 0], // Bottom vertices
            [-15, -10, 10], [15, -10, 10], [0, 10, 10]  // Top vertices
        ],
        faces = [
            [0, 1, 2], [3, 4, 5], // Triangular faces
            [0, 1, 4, 3], [1, 2, 5, 4], [2, 0, 3, 5] // Rectangular faces
        ]
    );
}

// Wedge-shaped block
module wedge_shaped_block() {
    translate([0, 0, 37]) // Adjust position to align above the triangular prism
    rotate([0, 0, 45]) // Rotate to align slanted surface properly
    polyhedron(
        points = [
            [-10, -10, 0], [10, -10, 0], [10, 10, 0], [-10, 10, 0], // Bottom vertices
            [-10, -10, 10], [10, -10, 10], [0, 10, 10]  // Top vertices
        ],
        faces = [
            [0, 1, 5, 4], [1, 2, 6, 5], [2, 3, 6], [3, 0, 4, 6], // Side faces
            [0, 1, 2, 3], [4, 5, 6] // Bottom and top faces
        ]
    );
}

// Assembly
module assembly() {
    base_block();
    flat_plate();
    trapezoidal_block();
    triangular_prism();
    wedge_shaped_block();
}

// Render the assembly
assembly();
