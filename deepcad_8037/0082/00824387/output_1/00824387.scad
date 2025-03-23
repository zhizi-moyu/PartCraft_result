
// Base Plate
module base_plate() {
    difference() {
        // Adjusted base plate dimensions: 60x10x7 for a thicker profile
        cube([60, 10, 7], center = true); 
        
        // Adding beveled edges
        hull() {
            translate([-30, -5, -3.5]) sphere(r = 3.5);
            translate([30, -5, -3.5]) sphere(r = 3.5);
        }
        
        // Holes evenly spaced along one edge
        for (x = [-25, -15, -5, 5, 15, 25]) { 
            translate([x, -5, 0]) 
                rotate([90, 0, 0]) 
                    cylinder(r = 1.5, h = 7, center = true); // Adjusted hole height to match new thickness
        }
    }
}

// Cylindrical Rod
module cylindrical_rod() {
    translate([0, 0, 23]) // Adjusted position to account for thicker base plate
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
            [10, 0, 20], // Top-right corner (for thickness)
            [0, -2, 0], // Bottom-left corner (offset for thickness)
            [10, -2, 0], // Bottom-right corner (offset for thickness)
            [0, -2, 20], // Top corner (offset for thickness)
            [10, -2, 20] // Top-right corner (offset for thickness)
        ],
        faces = [
            [0, 1, 2], // Front face
            [1, 3, 2], // Back face
            [4, 5, 6], // Front face (offset)
            [5, 7, 6], // Back face (offset)
            [0, 1, 5, 4], // Bottom face
            [2, 3, 7, 6], // Top face
            [0, 2, 6, 4], // Left face
            [1, 3, 7, 5] // Right face
        ]
    );
}

// Assembly
module assembly() {
    base_plate();
    
    // Position the first brace
    translate([-10, -5, 3.5]) // Adjusted position to align with base plate and rod
        rotate([0, 0, 45]) // Adjusted angle for proper support
        triangular_support_brace();
    
    // Position the second brace
    translate([10, -5, 3.5]) // Adjusted position to align with base plate and rod
        rotate([0, 0, -45]) // Adjusted angle for proper support
        triangular_support_brace();
    
    cylindrical_rod();
}

// Render the assembly
assembly();

