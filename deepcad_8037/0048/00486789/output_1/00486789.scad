
// Base Block
module base_block() {
    difference() {
        cube([60, 30, 10], center = false);
        translate([5, 5, 0])
            cube([50, 10, 7], center = false); // Deepened groove
        translate([5, 15, 0])
            cube([50, 10, 7], center = false); // Deepened groove
    }
}

// Side Clamp
module side_clamp() {
    difference() {
        cube([10, 30, 10], center = false);
        translate([2, 5, 0])
            cube([6, 20, 10], center = false);
        translate([0, 0, 0])
            cube([10, 30, 2], center = false); // Extended arms for more vertical profile
    }
}

// Top Clamp
module top_clamp() {
    difference() {
        cube([60, 30, 5], center = false);
        translate([5, 10, 0])
            cube([50, 10, 5], center = false);
    }
}

// Spacer Block
module spacer_block() {
    cube([60, 30, 2], center = false);
}

// Assembly
module assembly() {
    // Layer 4: Base Block
    base_block();

    // Layer 3: Side Clamps
    translate([0, 0, 10])
        side_clamp();
    translate([50, 0, 10])
        side_clamp();

    // Layer 2: Spacer Block
    translate([0, 0, 20])
        spacer_block();

    // Layer 1: Top Clamp
    translate([0, 0, 22])
        top_clamp();
}

// Render the assembly
assembly();

