
// Base Plate
module base_plate() {
    difference() {
        // Main rectangular block
        cube([50, 50, 10], center = true);
        
        // Circular through-holes
        translate([-15, -15, 0]) cylinder(r = 5, h = 20, center = true);
        translate([15, 15, 0]) cylinder(r = 5, h = 20, center = true);
    }
}

// Bolt
module bolt() {
    union() {
        // Cylindrical rod
        cylinder(r = 2.5, h = 30, center = false);
        
        // Threading (simplified as a smaller cylinder for visualization)
        translate([0, 0, 15]) cylinder(r = 2.25, h = 15, center = false);
    }
}

// Nut
module nut() {
    difference() {
        // Hexagonal prism
        rotate([0, 0, 30]) linear_extrude(height = 5) polygon(points = [[-3, -5], [3, -5], [5, -3], [5, 3], [3, 5], [-3, 5], [-5, 3], [-5, -3]]);
        
        // Internal threaded hole
        translate([0, 0, -2.5]) cylinder(r = 2.5, h = 10, center = true);
    }
}

// Assembly
module assembly() {
    // Layer 1: Base Plate
    base_plate();
    
    // Layer 2: Bolts and Nuts
    translate([-15, -15, 5]) {
        bolt();
        translate([0, 0, 30]) nut();
    }
    translate([15, 15, 5]) {
        bolt();
        translate([0, 0, 30]) nut();
    }
}

// Render the assembly
assembly();

