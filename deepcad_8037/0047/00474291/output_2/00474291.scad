
// Base block
module base_block() {
    difference() {
        // Main rectangular block
        cube([60, 30, 10], center = false);
        // Recessed groove along the length of the base block
        translate([10, 10, 0])
            cube([40, 10, 5], center = false);
    }
    // Raised section with increased height
    translate([50, 0, 10])
        cube([10, 30, 15], center = false); // Increased height from 10 to 15
}

// Vertical support
module vertical_support() {
    // Repositioned closer to the edge of the base block and reduced thickness
    translate([58, 0, 15]) { // Moved closer to the edge
        cube([5, 30, 30], center = false); // Reduced thickness from 10 to 5
    }
}

// Angled connector
module angled_connector() {
    // Triangular angled connector connecting vertical support to base block
    translate([50, 0, 10]) {
        polyhedron(
            points = [
                [0, 0, 0], [10, 0, 0], [10, 30, 0], [0, 30, 0], // Base rectangle
                [0, 0, 15], [10, 0, 15], [5, 30, 15]  // Top points forming a triangular shape
            ],
            faces = [
                [0, 1, 5, 4], [1, 2, 6, 5], [2, 3, 6], [3, 0, 4], // Side faces
                [4, 5, 6], // Top triangular face
                [0, 1, 2, 3]  // Bottom face
            ]
        );
    }
}

// Flat plate
module flat_plate() {
    // Thin flat plate covering the recessed groove
    translate([10, 10, 5]) {
        cube([40, 10, 1], center = false);
    }
}

// Assembly
module assembly() {
    base_block();
    vertical_support();
    angled_connector();
    flat_plate();
}

// Render the assembly
assembly();

