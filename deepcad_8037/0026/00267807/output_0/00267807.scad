
// Define dimensions for each component
module central_block() {
    difference() {
        union() {
            // Main rectangular prism
            cube([40, 20, 10], center = true);
            // Protruding section
            translate([0, 10, 5])
                cube([20, 10, 10], center = true);
        }
    }
}

module side_block() {
    difference() {
        // Main rectangular block
        cube([30, 20, 10], center = true);
        // Cutout section
        translate([0, -5, 5])
            cube([10, 10, 10], center = true);
    }
}

module connector_block() {
    union() {
        // Main rectangular block
        cube([30, 20, 10], center = true);
        // Protruding section
        translate([5, 0, 5])
            cube([10, 10, 10], center = true);
    }
}

module spacer_block() {
    // Small rectangular block
    cube([10, 10, 10], center = true);
}

// Assemble the model
module assembly() {
    // Layer 1: Central block
    translate([0, 0, 40])
        central_block();

    // Layer 2: Spacer blocks
    translate([-15, 0, 30])
        spacer_block();
    translate([15, 0, 30])
        spacer_block();

    // Layer 3: Side blocks
    translate([-30, 0, 20])
        side_block();
    translate([30, 0, 20])
        side_block();

    // Layer 4: Connector block
    translate([0, 0, 10])
        connector_block();
}

// Render the assembly
assembly();

