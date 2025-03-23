
// Define dimensions for components
module central_block() {
    cube([40, 20, 10], center = true);
}

module angled_connector() {
    polyhedron(
        points = [
            [0, 0, 0], [20, 0, 0], [20, 10, 0], [0, 10, 0], // Bottom face
            [0, 0, 10], [20, 0, 10], [20, 10, 10], [0, 10, 10]  // Top face
        ],
        faces = [
            [0, 1, 2, 3], // Bottom
            [4, 5, 6, 7], // Top
            [0, 1, 5, 4], // Side 1
            [1, 2, 6, 5], // Side 2
            [2, 3, 7, 6], // Side 3
            [3, 0, 4, 7]  // Side 4
        ]
    );
}

module flat_connector() {
    cube([40, 10, 5], center = true);
}

module bolt() {
    cylinder(h = 20, r = 2, center = true);
}

module nut() {
    translate([0, 0, -2])
    rotate([0, 0, 0])
}

// Assemble the model
module flexible_coupling() {
    // Layer 1: Top angled connectors
    translate([-20, 10, 20]) angled_connector();
    translate([20, 10, 20]) angled_connector();

    // Layer 2: Flat connector
    translate([0, 0, 10]) flat_connector();

    // Layer 3: Central block
    translate([0, 0, 0]) central_block();

    // Layer 4: Bottom flat connector
    translate([0, 0, -10]) flat_connector();

    // Layer 5: Bottom angled connectors
    translate([-20, 10, -20]) angled_connector();
    translate([20, 10, -20]) angled_connector();
}

// Render the model
flexible_coupling();

