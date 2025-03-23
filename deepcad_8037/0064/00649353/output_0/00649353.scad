
// Nut Component
module nut() {
    difference() {
        // Hexagonal outer shape
        cylinder(h = 5, r = 6, $fn = 6);
        // Cylindrical inner hole
        translate([0, 0, -1]) cylinder(h = 7, r = 3, $fn = 100);
    }
}

// Render the nut
nut();

