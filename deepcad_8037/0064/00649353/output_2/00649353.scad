// Nut Component
module nut() {
    difference() {
        // Hexagonal outer shape with uniform dimensions
        cylinder(h = 4, r = 6, $fn = 6); // Reduced height to match original model
        
        // Cylindrical inner hole with reduced depth
        translate([0, 0, -0.5]) cylinder(h = 4, r = 3, $fn = 100); // Adjusted height to match original model
    }
}

// Render the nut
nut();
