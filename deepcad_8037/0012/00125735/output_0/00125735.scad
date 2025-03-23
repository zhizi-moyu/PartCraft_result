
// Base block
module base_block() {
    cube([20, 20, 10], center = true);
}

// L-shaped connector
module l_shaped_connector() {
    difference() {
        cube([20, 20, 20], center = true);
        translate([0, 0, -10])
            cube([20, 10, 20], center = true);
    }
}

// Angled support
module angled_support() {
    polyhedron(
        points = [
            [0, 0, 0],    // Point 0
            [20, 0, 0],   // Point 1
            [20, 20, 0],  // Point 2
            [0, 20, 0],   // Point 3
            [0, 0, 20],   // Point 4
            [20, 0, 20]   // Point 5
        ],
        faces = [
            [0, 1, 4],    // Base triangle
            [1, 5, 4],    // Side triangle
            [1, 2, 5],    // Side triangle
            [2, 3, 5],    // Side triangle
            [3, 0, 4],    // Side triangle
            [0, 3, 2, 1]  // Bottom face
        ]
    );
}

// Assemble the model
module model() {
    // Layer 3: Base block
    translate([0, 0, -15])
        base_block();

    // Layer 2: L-shaped connector
    translate([0, 0, 5])
        l_shaped_connector();

    // Layer 1: Angled support
    translate([0, 0, 25])
        angled_support();
}

// Render the model
model();

