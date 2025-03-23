
// Base Plate
module base_plate() {
    difference() {
        cube([60, 10, 5], center = true); // Base plate dimensions: 60x10x5
        for (x = [-25, -15, -5, 5, 15, 25]) { // Holes evenly spaced along one edge
            translate([x, -5, 0]) 
                rotate([90, 0, 0]) 
                    cylinder(r = 1.5, h = 5, center = true); // Hole radius: 1.5
        }
    }
}

// Cylindrical Rod
module cylindrical_rod() {
    translate([0, 0, 20]) // Position the rod above the base plate
        rotate([0, 45, 0]) // Angle the rod upward
            cylinder(r = 3, h = 40, center = true); // Rod dimensions: radius 3, height 40
}

// Triangular Support Brace
module triangular_support_brace() {
    polyhedron(
        points = [
            [0, 0, 0], // Bottom-left corner
            [10, 0, 0], // Bottom-right corner
            [0, 0, 20], // Top corner
            [10, 0, 20] // Top-right corner (for thickness)
        ],
        faces = [
            [0, 1, 2], // Front face
            [1, 3, 2], // Back face
            [0, 1, 3, 2] // Bottom face
        ]
    );
}

// Assembly
module assembly() {
    base_plate();
    translate([-10, 0, 0]) // Position the first brace
        triangular_support_brace();
    translate([10, 0, 0]) // Position the second brace
        triangular_support_brace();
    cylindrical_rod();
}

// Render the assembly
assembly();

