
// Define the geometric part
module geometric_part() {
    difference() {
        // Base shape: a trapezoidal prism with a slanted edge and tapering thickness
        hull() {
            // Define the bottom face of the trapezoid
            translate([0, 0, 0]) cube([10, 5, 2], center = true);
            translate([5, 0, 0]) cube([10, 5, 2], center = true);
        }
        
        // Add a slanted edge and tapering thickness
        translate([0, 0, 0]) {
            polyhedron(
                points = [
                    [0, 0, 0], [10, 0, 0], [10, 5, 0], [0, 5, 0], // Bottom face
                    [2, 0, 2], [8, 0, 2], [8, 5, 2], [2, 5, 2]  // Top face
                ],
                faces = [
                    [0, 1, 5, 4], [1, 2, 6, 5], [2, 3, 7, 6], [3, 0, 4, 7], // Side faces
                    [0, 1, 2, 3], // Bottom face
                    [4, 5, 6, 7]  // Top face
                ]
            );
        }
    }
}

// Render the part
geometric_part();

