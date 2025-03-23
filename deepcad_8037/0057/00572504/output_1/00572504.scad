
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
    cube([60, 15, 5], center = false); // Adjusted arm with consistent thickness and extended length
}

// Vertical arm
module vertical_arm() {
    cube([10, 10, 30], center = false); // Straight and consistent rectangular shape
}

// Connector block
module connector_block() {
    difference() {
        cube([10, 10, 20], center = false); // Main block
        translate([2.5, 0, 0]) {
            cube([5, 10, 20], center = false); // Single slot
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

