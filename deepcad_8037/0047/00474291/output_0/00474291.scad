
// Base block
module base_block() {
    difference() {
        // Main rectangular block
        cube([60, 30, 10], center = false);
        // Recessed groove
        translate([10, 10, 0])
            cube([40, 10, 5], center = false);
        // Raised section
        translate([50, 0, 10])
            cube([10, 30, 5], center = false);
    }
}

// Vertical support
module vertical_support() {
    translate([50, 0, 15]) {
        cube([10, 30, 30], center = false);
    }
}

// Angled connector
module angled_connector() {
    translate([40, 0, 10]) {
        polyhedron(
            points = [
                [0, 0, 0], [10, 0, 0], [10, 30, 0], [0, 30, 0], // Base rectangle
                [0, 0, 15], [10, 0, 15], [10, 30, 15], [0, 30, 15]  // Top rectangle
            ],
            faces = [
                [0, 1, 5, 4], [1, 2, 6, 5], [2, 3, 7, 6], [3, 0, 4, 7], // Side faces
                [4, 5, 6, 7], // Top face
                [0, 1, 2, 3]  // Bottom face
            ]
        );
    }
}

// Flat plate
module flat_plate() {
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

