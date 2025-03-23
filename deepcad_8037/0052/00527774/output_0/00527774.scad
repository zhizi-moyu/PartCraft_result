
// Define the dimensions for each component
module l_shaped_block() {
    difference() {
        cube([20, 40, 10]); // Outer block
        translate([10, 10, 0]) cube([10, 30, 10]); // Cutout to form L-shape
    }
}

module small_rectangular_block() {
    cube([10, 20, 10]);
}

module notched_rectangular_block() {
    difference() {
        cube([30, 20, 10]); // Outer block
        translate([20, 0, 0]) cube([10, 10, 10]); // Notch
    }
}

module angled_block() {
    polyhedron(
        points=[
            [0, 0, 0], [30, 0, 0], [30, 20, 0], [0, 20, 0], // Bottom face
            [0, 0, 10], [30, 0, 10], [15, 20, 10], [0, 20, 10] // Top face
        ],
        faces=[
            [0, 1, 2, 3], // Bottom
            [4, 5, 6, 7], // Top
            [0, 1, 5, 4], // Side 1
            [1, 2, 6, 5], // Side 2
            [2, 3, 7, 6], // Side 3
            [3, 0, 4, 7]  // Side 4
        ]
    );
}

module flat_rectangular_block() {
    cube([30, 20, 5]);
}

module v_shaped_block() {
    difference() {
        cube([30, 20, 10]); // Outer block
        translate([0, 0, 0]) rotate([0, 0, 45]) cube([30, 30, 10]); // Cutout to form V-shape
    }
}

// Assemble the components based on the positional relationships
module assembly() {
    translate([0, 0, 50]) v_shaped_block(); // Layer 1
    translate([0, 0, 40]) angled_block(); // Layer 2
    translate([0, 0, 35]) flat_rectangular_block(); // Layer 3
    translate([0, 0, 25]) notched_rectangular_block(); // Layer 4
    translate([0, 0, 15]) small_rectangular_block(); // Layer 5
    translate([0, 0, 0]) l_shaped_block(); // Layer 6
}

// Render the assembly
assembly();

