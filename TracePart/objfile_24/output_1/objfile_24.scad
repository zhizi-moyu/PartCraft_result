
// Parameters
shaft_diameter = 20;
shaft_length = 60; // Adjusted to match original model
flange_diameter = 40;
flange_thickness = 6; // Adjusted thickness for better alignment
spacer_thickness = 3; // Adjusted to ensure proper spacing
flexible_element_thickness = 4; // Adjusted for correct positioning
bolt_diameter = 4;
bolt_length = 18; // Adjusted to ensure bolts secure properly
nut_diameter = 6;
nut_thickness = 4; // Adjusted for better securing
bolt_spacing = 32; // Adjusted for correct hole placement
bolt_count = 6; // Increased number of bolts for better accuracy

// Modules
module shaft() {
    cylinder(h = shaft_length, d = shaft_diameter, center = true);
}

module flange_plate() {
    difference() {
        cylinder(h = flange_thickness, d = flange_diameter, center = true);
        for (i = [0:bolt_count - 1]) {
            rotate([0, 0, i * (360 / bolt_count)])
                translate([bolt_spacing / 2, 0, 0])
                cylinder(h = flange_thickness + 1, d = bolt_diameter, center = true);
        }
    }
}

module spacer_ring() {
    difference() {
        cylinder(h = spacer_thickness, d = flange_diameter, center = true);
        cylinder(h = spacer_thickness + 1, d = shaft_diameter + 5, center = true);
    }
}

module flexible_element() {
    difference() {
        cylinder(h = flexible_element_thickness, d = flange_diameter, center = true);
        cylinder(h = flexible_element_thickness + 1, d = shaft_diameter + 5, center = true);
    }
}

module bolt() {
    cylinder(h = bolt_length, d = bolt_diameter, center = true);
}

module nut() {
    cylinder(h = nut_thickness, d = nut_diameter, center = true);
}

// Assembly
module coupling() {
    translate([0, 0, -shaft_length / 2]) shaft();
    
    translate([0, 0, -shaft_length / 2 + flange_thickness / 2]) flange_plate();
    
    translate([0, 0, -shaft_length / 2 + flange_thickness + spacer_thickness / 2]) spacer_ring();
    
    translate([0, 0, -shaft_length / 2 + flange_thickness + spacer_thickness + flexible_element_thickness / 2]) flexible_element();
    
    translate([0, 0, -shaft_length / 2 + flange_thickness + spacer_thickness + flexible_element_thickness + flange_thickness / 2]) flange_plate();
    
    translate([0, 0, -shaft_length / 2 + flange_thickness * 2 + spacer_thickness + flexible_element_thickness + spacer_thickness / 2]) spacer_ring();
    
    translate([0, 0, -shaft_length / 2 + flange_thickness * 2 + spacer_thickness * 2 + flexible_element_thickness * 2 / 2]) flexible_element();
    
    translate([0, 0, -shaft_length / 2 + flange_thickness * 3 + spacer_thickness * 2 + flexible_element_thickness * 2 / 2]) flange_plate();
    
    translate([0, 0, shaft_length / 2]) shaft();
    
    for (i = [0:bolt_count - 1]) {
        rotate([0, 0, i * (360 / bolt_count)])
            translate([bolt_spacing / 2, 0, -shaft_length / 2 + flange_thickness])
            bolt();
        
        rotate([0, 0, i * (360 / bolt_count)])
            translate([bolt_spacing / 2, 0, -shaft_length / 2 + flange_thickness * 2 + spacer_thickness * 2 + flexible_element_thickness * 2])
            bolt();
        
        rotate([0, 0, i * (360 / bolt_count)])
            translate([bolt_spacing / 2, 0, -shaft_length / 2 + flange_thickness / 2])
            nut();
        
        rotate([0, 0, i * (360 / bolt_count)])
            translate([bolt_spacing / 2, 0, -shaft_length / 2 + flange_thickness * 3 + spacer_thickness * 2 + flexible_element_thickness * 2])
            nut();
    }
}

// Render the coupling
coupling();

