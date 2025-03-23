
// Function to create a wedge block
module wedge_block(base_length, base_width, height) {
    polyhedron(
        points=[
            [0, 0, 0],                // Point 0: Bottom-left corner
            [base_length, 0, 0],      // Point 1: Bottom-right corner
            [0, base_width, 0],       // Point 2: Top-left corner
            [base_length, base_width, 0], // Point 3: Top-right corner
            [0, 0, height],           // Point 4: Apex of the wedge (left)
            [base_length, 0, height]  // Point 5: Apex of the wedge (right)
        ],
        faces=[
            [0, 1, 5, 4], // Bottom face
            [0, 2, 4],    // Left triangular face
            [1, 3, 5],    // Right triangular face
            [2, 3, 5, 4], // Top face
            [0, 1, 3, 2]  // Back rectangular face
        ]
    );
}

// Parameters for the wedge block
base_length = 20; // Length of the rectangular base
base_width = 10;  // Width of the rectangular base
height = 15;      // Height of the wedge

// Generate the 3D model
wedge_block(base_length, base_width, height);

