
// Central Shaft
module central_shaft() {
    difference() {
        // Outer cylinder
        cylinder(h = 50, r = 10, center = true);
        // Inner hollow
        translate([0, 0, -25])
            cylinder(h = 50, r = 5, center = true);
    }
}

// Render the central shaft
central_shaft();

