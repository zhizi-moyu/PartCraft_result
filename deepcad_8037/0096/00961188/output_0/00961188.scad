
// Function to create a single wedge block
module wedge_block() {
    // Dimensions of the wedge block
    base_length = 20;  // Length of the base
    top_length = 10;   // Length of the top
    height = 10;       // Height of the block
    width = 10;        // Width of the block

    // Create the wedge block using polyhedron
    polyhedron(
        points = [
            [0, 0, 0],                  // Point 0: Bottom-left corner of the base
            [base_length, 0, 0],        // Point 1: Bottom-right corner of the base
            [base_length, width, 0],    // Point 2: Top-right corner of the base
            [0, width, 0],              // Point 3: Top-left corner of the base
            [(base_length - top_length) / 2, 0, height],  // Point 4: Bottom-left corner of the top
            [(base_length + top_length) / 2, 0, height],  // Point 5: Bottom-right corner of the top
            [(base_length + top_length) / 2, width, height],  // Point 6: Top-right corner of the top
            [(base_length - top_length) / 2, width, height]   // Point 7: Top-left corner of the top
        ],
        faces = [
            [0, 1, 2, 3],  // Base face
            [4, 5, 6, 7],  // Top face
            [0, 1, 5, 4],  // Front face
            [1, 2, 6, 5],  // Right face
            [2, 3, 7, 6],  // Back face
            [3, 0, 4, 7]   // Left face
        ]
    );
}

// Arrange six wedge blocks in the same vertical layer
translate([0, 0, 0]) wedge_block();  // Wedge block 1
translate([30, 0, 0]) wedge_block(); // Wedge block 2
translate([60, 0, 0]) wedge_block(); // Wedge block 3
translate([90, 0, 0]) wedge_block(); // Wedge block 4
translate([120, 0, 0]) wedge_block(); // Wedge block 5
translate([150, 0, 0]) wedge_block(); // Wedge block 6

