
// Parameters for the wedge block
wedge_length = 30;  // Length of the rectangular base
wedge_width = 10;   // Width of the rectangular base
wedge_height = 15;  // Height of the triangular prism

// Function to create a wedge block
module wedge_block() {
    polyhedron(
        points = [
            [0, 0, 0],                  // Point 0: Bottom-left corner of the base
            [wedge_length, 0, 0],       // Point 1: Bottom-right corner of the base
            [wedge_length, wedge_width, 0], // Point 2: Top-right corner of the base
            [0, wedge_width, 0],        // Point 3: Top-left corner of the base
            [wedge_length, 0, wedge_height], // Point 4: Apex of the triangular face
            [0, wedge_width, wedge_height]  // Point 5: Opposite apex of the triangular face
        ],
        faces = [
            [0, 1, 4],  // Bottom triangular face
            [0, 4, 5],  // Slanted triangular face
            [0, 5, 3],  // Left rectangular face
            [1, 2, 4],  // Right rectangular face
            [3, 5, 4, 2] // Top rectangular face
        ]
    );
}

// Render the wedge block
wedge_block();

