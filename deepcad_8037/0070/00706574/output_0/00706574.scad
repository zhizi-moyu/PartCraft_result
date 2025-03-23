
// Function to create a wedge block
module wedge_block() {
    polyhedron(
        points=[
            [0, 0, 0],  // Bottom-left corner
            [20, 0, 0], // Bottom-right corner
            [0, 10, 0], // Top-left corner
            [20, 10, 10], // Top-right corner
            [0, 0, 10], // Back-bottom-left corner
            [20, 0, 10] // Back-bottom-right corner
        ],
        faces=[
            [0, 1, 2], // Bottom face
            [1, 3, 2], // Slanted face
            [0, 2, 4], // Left face
            [2, 3, 4], // Top face
            [1, 5, 3], // Right face
            [0, 4, 5], // Back face
            [4, 3, 5]  // Back-slanted face
        ]
    );
}

// Parameters for positioning the wedge blocks
num_blocks = 6; // Number of wedge blocks
radius = 50;    // Radius of the circular arrangement
angle_step = 360 / num_blocks; // Angle step for even distribution

// Generate the symmetrical arrangement of wedge blocks
for (i = [0:num_blocks-1]) {
    rotate([0, 0, i * angle_step]) {
        translate([radius, 0, 0]) {
            rotate([0, 90, 0]) {
                wedge_block();
            }
        }
    }
}

