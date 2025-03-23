// Define the geometric part
module geometric_part() {
    difference() {
        // Base shape: an irregular wedge-like shape with a slanted edge and tapering thickness
        polyhedron(
            points = [
                [0, 0, 0], [10, 0, 0], [10, 5, 0], [0, 5, 0], // Bottom face
                [2, 0, 2], [8, 0, 2], [7, 5, 2], [3, 5, 2]  // Top face (adjusted for tapering and slanted edge)
            ],
            faces = [
                [0, 1, 5, 4], [1, 2, 6, 5], [2, 3, 7, 6], [3, 0, 4, 7], // Side faces
                [0, 1, 2, 3], // Bottom face
                [4, 5, 6, 7]  // Top face
            ]
        );
    }
}

// Render the part
geometric_part();
