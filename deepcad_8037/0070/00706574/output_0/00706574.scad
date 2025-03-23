
// Function to create a wedge block
module wedge_block(base_length, base_width, height) {
    polyhedron(
        points=[
            [0, 0, 0], // Point 0: Bottom-left corner of the base
            [base_length, 0, 0], // Point 1: Bottom-right corner of the base
            [base_length, base_width, 0], // Point 2: Top-right corner of the base
            [0, base_width, 0], // Point 3: Top-left corner of the base
            [0, 0, height], // Point 4: Apex of the wedge (above Point 0)
            [base_length, 0, height] // Point 5: Apex of the wedge (above Point 1)
        ],
        faces=[
            [0, 1, 5, 4], // Slanted face
            [1, 2, 3, 0], // Bottom rectangular face
            [0, 3, 4], // Left triangular face
            [1, 5, 2], // Right triangular face
            [4, 5, 2, 3] // Top rectangular face
        ]
    );
}

// Parameters for the wedge block
base_length = 20; // Length of the rectangular base
base_width = 10; // Width of the rectangular base
height = 15; // Height of the wedge

// Positioning parameters
spacing = 25; // Vertical spacing between blocks

// Layer 1: Arrange six wedge blocks in a vertical configuration
for (i = [0:5]) {
    translate([0, 0, i * spacing]) {
        rotate([0, 0, i * 60]) { // Rotate each block by 60 degrees around the Z-axis
            wedge_block(base_length, base_width, height);
        }
    }
}

