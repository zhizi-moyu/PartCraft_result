
// Define dimensions for each component
module central_block() {
    // Adjusted T-shape with a longer and more pronounced perpendicular protrusion
    union() {
        // Main rectangular prism
        cube([40, 20, 10], center = true);
        // Perpendicular protrusion
        translate([0, 10, 5])
            cube([30, 10, 10], center = true); // Extended length to match original model
    }
}

module side_block() {
    // Adjusted step-like profile with a smaller cutout and larger overall dimensions
    difference() {
        // Main rectangular block
        cube([35, 25, 10], center = true); // Increased dimensions to match original model
        // Smaller rectangular cutout
        translate([0, -5, 5])
            cube([8, 10, 10], center = true); // Reduced cutout size to match original model
    }
}

module connector_block() {
    // Adjusted asymmetrical profile with a larger and more offset protrusion
    union() {
        // Main rectangular block
        cube([30, 20, 10], center = true);
        // Offset protrusion
        translate([15, 0, 5]) // Increased offset to match original model
            cube([15, 10, 10], center = true); // Enlarged protrusion to match original model
    }
}

module spacer_block() {
    // Adjusted uniform rectangular prism with larger dimensions
    cube([15, 15, 10], center = true); // Increased dimensions to match original model
}

// Assemble the model
module assembly() {
    // Layer 1: Central block
    translate([0, 0, 40])
        central_block();

    // Layer 2: Spacer blocks
    translate([-20, 0, 30]) // Adjusted position to match increased dimensions
        spacer_block();
    translate([20, 0, 30]) // Adjusted position to match increased dimensions
        spacer_block();

    // Layer 3: Side blocks
    translate([-35, 0, 20]) // Adjusted position to match increased dimensions
        side_block();
    translate([35, 0, 20]) // Adjusted position to match increased dimensions
        side_block();

    // Layer 4: Connector block
    translate([0, 0, 10])
        connector_block();
}

// Render the assembly
assembly();

