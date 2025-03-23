
// Base Plate
module base_plate() {
    difference() {
        // Main rectangular plate
        cube([100, 60, 5], center = true);
        
        // Circular holes
        translate([-30, 20, 2.5]) cylinder(r = 5, h = 10, center = true);
        translate([30, 20, 2.5]) cylinder(r = 5, h = 10, center = true);
        translate([-30, -20, 2.5]) cylinder(r = 5, h = 10, center = true);
        translate([30, -20, 2.5]) cylinder(r = 5, h = 10, center = true);
        
        // Rectangular slot
        translate([0, 0, 2.5]) cube([20, 10, 10], center = true);
    }
}

// Rectangular Block
module rectangular_block() {
    cube([20, 10, 5], center = true);
}

// L-Shaped Bracket
module L_shaped_bracket() {
    union() {
        // Horizontal arm
        translate([0, 0, 2.5]) cube([60, 10, 5], center = true);
        
        // Vertical arm
        translate([25, -25, 2.5]) rotate([0, 0, 90]) cube([40, 10, 5], center = true);
        
        // Circular holes on horizontal arm
        translate([-20, 0, 2.5]) cylinder(r = 5, h = 10, center = true);
        translate([20, 0, 2.5]) cylinder(r = 5, h = 10, center = true);
    }
}

// Assembly
module assembly() {
    // Layer 1: Rectangular Block inserted into Base Plate
    base_plate();
    translate([0, 0, 2.5]) rectangular_block();
    
    // Layer 3: L-Shaped Bracket mounted onto Base Plate
    translate([0, -30, 2.5]) L_shaped_bracket();
}

// Render the assembly
assembly();

