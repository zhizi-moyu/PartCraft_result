// Nut Component
module nut() {
    difference() {
        // Hexagonal outer shape with uniform dimensions
        cylinder(h = 5, r = 6, $fn = 6);
        // Cylindrical inner hole with reduced depth
        translate([0, 0, -0.5]) cylinder(h = 6, r = 3, $fn = 100);
    }
}

// Render the nut
nut();
