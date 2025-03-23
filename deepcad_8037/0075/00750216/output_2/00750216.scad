
// Base Plate
module base_plate() {
    difference() {
        // Main rectangular block
        cube([50, 50, 8], center = true); // Adjusted thickness to match original model
        
        // Circular through-holes
        translate([-15, -15, 0]) cylinder(r = 5, h = 20, center = true); // Changed slots to circular holes
        translate([15, 15, 0]) cylinder(r = 5, h = 20, center = true); // Changed slots to circular holes
    }
}

// Bolt
module bolt() {
    union() {
        // Cylindrical rod
        cylinder(r = 2.5, h = 15, center = false); // Shortened bolt length to match original model
        
        // Threading (simplified as a smaller cylinder for visualization)
        translate([0, 0, 5]) cylinder(r = 2.25, h = 10, center = false); // Added threading
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
    translate([-15, -15, 4]) { // Adjusted bolt and nut position
        bolt();
        translate([0, 0, -5]) nut(); // Added nut to fasten the bolt
    }
    translate([15, 15, 4]) { // Adjusted bolt and nut position
        bolt();
        translate([0, 0, -5]) nut(); // Added nut to fasten the bolt
    }
}

// Render the assembly
assembly();

