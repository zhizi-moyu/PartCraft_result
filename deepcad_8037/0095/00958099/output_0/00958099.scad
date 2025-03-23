
// Central Hub Component
module central_hub() {
    difference() {
        // Outer cylinder
        cylinder(h = 20, r1 = 15, r2 = 15, $fn = 100);
        // Inner hollow cylinder
        translate([0, 0, -1]) cylinder(h = 22, r = 10, $fn = 100);
        // Flared base
        translate([0, 0, -2]) cylinder(h = 2, r1 = 15, r2 = 18, $fn = 100);
    }
}

// Render the central hub
central_hub();

