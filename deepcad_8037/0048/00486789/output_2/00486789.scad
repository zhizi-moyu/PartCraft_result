
// Base Block
module base_block() {
    difference() {
        cube([60, 30, 10], center = false);
        translate([5, 5, 0])
            cube([50, 10, 8], center = false); // Deepened groove
        translate([5, 15, 0])
            cube([50, 10, 8], center = false); // Deepened groove
    }
}

// Side Clamp
module side_clamp() {
    difference() {
        cube([10, 30, 15], center = false); // Extended height for longer arms
        translate([2, 5, 0])
            cube([6, 20, 15], center = false); // Adjusted cutout to match extended height
        translate([0, 0, 0])
            cube([10, 30, 2], center = false); // Extended arms for more vertical profile
    }
}

// Top Clamp
module top_clamp() {
    difference() {
        cube([60, 30, 5], center = false);
        translate([5, 8, 0]) // Adjusted position for better alignment
            cube([50, 14, 5], center = false); // Widened groove
    }
}

// Spacer Block
module spacer_block() {
    cube([60, 30, 4], center = false); // Increased thickness for uniformity
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
    translate([0, 0, 25]) // Adjusted height to match increased spacer thickness
        spacer_block();

    // Layer 1: Top Clamp
    translate([0, 0, 29]) // Adjusted height to match increased spacer thickness
        top_clamp();
}

// Render the assembly
assembly();

