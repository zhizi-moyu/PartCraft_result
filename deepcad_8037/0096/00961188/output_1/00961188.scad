
// Function to create the wedge-shaped block
module wedge_shaped_block() {
    // Define the dimensions of the wedge
    base_length = 40;  // Length of the base
    base_width = 15;   // Width of the base (reduced to match original model)
    height = 20;       // Height of the wedge (increased to match original model)
    top_length = 15;   // Length of the top edge (adjusted for increased tapering)

    // Create the wedge using a polyhedron
    polyhedron(
        points = [
            [0, 0, 0],                  // Point 0: Bottom-left corner of the base
            [base_length, 0, 0],        // Point 1: Bottom-right corner of the base
            [base_length, base_width, 0], // Point 2: Top-right corner of the base
            [0, base_width, 0],        // Point 3: Top-left corner of the base
            [(base_length - top_length) / 2, 0, height], // Point 4: Bottom-left corner of the top
            [(base_length + top_length) / 2, 0, height], // Point 5: Bottom-right corner of the top
            [(base_length + top_length) / 2, base_width, height], // Point 6: Top-right corner of the top
            [(base_length - top_length) / 2, base_width, height]  // Point 7: Top-left corner of the top
        ],
        faces = [
            [0, 1, 5, 4], // Bottom face
            [1, 2, 6, 5], // Right face
            [2, 3, 7, 6], // Top face
            [3, 0, 4, 7], // Left face
            [4, 5, 6, 7], // Slanted top face
            [0, 1, 2, 3]  // Flat bottom face
        ]
    );
}

// Call the module to render the wedge-shaped block
wedge_shaped_block();

