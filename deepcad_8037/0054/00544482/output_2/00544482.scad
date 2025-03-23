
// Spacer Ring Component
module spacer_ring() {
    difference() {
        // Outer cylinder
        cylinder(h = 1.2, r = 20, $fn = 100); // Reduced height to match original model's flatness
        // Inner hollow
        cylinder(h = 1.3, r = 10, $fn = 100); // Adjusted height to ensure proper hollowing
    }
}

// Render the spacer ring
spacer_ring();

// Flange Plate Component
module flange_plate() {
    cube([30, 30, 0.8], center = true); // Reduced thickness to match original model's flatness
}

// Render the flange plate
flange_plate();

// Central Craft Component
module central_craft() {
    difference() {
        // Outer cylinder
        cylinder(h = 10, r = 15, $fn = 100);
        // Inner hollow
        cylinder(h = 10.1, r = 5, $fn = 100);
    }
}

// Render the central craft
central_craft();

// Input Craft Component
module input_craft() {
    difference() {
        // Outer cylinder
        cylinder(h = 8, r = 12, $fn = 100);
        // Inner hollow
        cylinder(h = 8.1, r = 4, $fn = 100);
    }
}

// Render the input craft
input_craft();

// Output Craft Component
module output_craft() {
    difference() {
        // Outer cylinder
        cylinder(h = 8, r = 12, $fn = 100);
        // Inner hollow
        cylinder(h = 8.1, r = 4, $fn = 100);
    }
}

// Render the output craft
output_craft();

// Nut Component
module nut() {
    difference() {
        // Hexagonal outer shape
        rotate([0, 0, 30]) {
            linear_extrude(height = 3) {
                polygon(points = [[-5, -8], [5, -8], [8, -5], [8, 5], [5, 8], [-5, 8], [-8, 5], [-8, -5]]);
            }
        }
        // Threaded interior
        cylinder(h = 3.1, r = 3, $fn = 100);
    }
}

// Render the nut
nut();

// Bolt Component
module bolt() {
    union() {
        // Cylindrical body
        cylinder(h = 20, r = 3, $fn = 100);
        // Flat head
        cylinder(h = 2, r = 5, $fn = 100);
    }
}

// Render the bolt
bolt();

