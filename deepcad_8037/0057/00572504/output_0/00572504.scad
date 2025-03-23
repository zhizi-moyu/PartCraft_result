
// Base block
module base_block() {
    difference() {
        cube([30, 20, 40], center = false); // Main block
        translate([10, 0, 0]) {
            cube([10, 20, 40], center = false); // Slot
        }
    }
}

// Horizontal arm
module horizontal_arm() {
    cube([50, 10, 5], center = false); // Main arm
}

// Vertical arm
module vertical_arm() {
    cube([10, 10, 30], center = false); // Main arm
}

// Connector block
module connector_block() {
    difference() {
        cube([10, 10, 20], center = false); // Main block
        translate([2.5, 0, 0]) {
            cube([5, 10, 20], center = false); // Slot
        }
    }
}

// Assembly
module assembly() {
    // Layer 1: Horizontal arm
    translate([10, 5, 35]) {
        horizontal_arm();
    }

    // Layer 2: Vertical arm
    translate([45, 5, 5]) {
        vertical_arm();
    }

    // Layer 3: Connector block
    translate([10, 5, 15]) {
        connector_block();
    }

    // Layer 4: Base block
    base_block();
}

// Render the assembly
assembly();

