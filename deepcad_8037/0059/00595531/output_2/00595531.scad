
// Base block
module base_block() {
    // Removed recessed section to make the top surface flat
    translate([0, 0, 5]) // Adjust position to align flat
    cube([50, 30, 10], center = true);
}

// Flat plate
module flat_plate() {
    // Repositioned to sit directly on the base block without any gap
    translate([0, 0, 10]) // Adjust position to align flush with the base block
    cube([50, 30, 2], center = true);
}

// Trapezoidal block
module trapezoidal_block() {
    // Adjusted top surface width and slanted sides to match the original model
    translate([0, 0, 12]) // Adjust position to align above the flat plate
    rotate([0, 0, 0]) // Ensure proper orientation
    polyhedron(
        points = [
            [-25, -15, 0], [25, -15, 0], [22, 15, 0], [-22, 15, 0], // Bottom vertices
            [-30, -15, 10], [30, -15, 10], [25, 15, 10], [-25, 15, 10]  // Top vertices
        ],
        faces = [
            [0, 1, 5, 4], [1, 2, 6, 5], [2, 3, 7, 6], [3, 0, 4, 7], // Side faces
            [0, 1, 2, 3], [4, 5, 6, 7] // Top and bottom faces
        ]
    );
}

// Triangular prism
module triangular_prism() {
    // Reoriented to align its triangular base parallel to the base block
    translate([0, 0, 22]) // Adjust position to align above the trapezoidal block
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
    // Increased slant angle and smoothed edges to match the original model
    translate([0, 0, 32]) // Adjust position to align above the triangular prism
    rotate([0, 0, 0]) // Ensure proper orientation
    polyhedron(
        points = [
            [-10, -10, 0], [10, -10, 0], [10, 10, 0], [-10, 10, 0], // Bottom vertices
            [-10, -10, 10], [10, -10, 10], [0, 15, 10]  // Top vertices
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

