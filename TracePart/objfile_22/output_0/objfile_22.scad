
// Parameters
shaft_diameter = 20;
shaft_length = 40;
flange_diameter = 50;
flange_thickness = 5;
bolt_hole_diameter = 5;
bolt_diameter = 4;
bolt_length = 20;
nut_diameter = 8;
nut_thickness = 4;
flexible_element_thickness = 2;
flexible_element_width = 40;
flexible_element_length = 50;
bolt_spacing = 30;

// Module for shaft
module shaft() {
    difference() {
        cylinder(h = shaft_length, d = shaft_diameter, center = true);
        cylinder(h = shaft_length, d = bolt_hole_diameter, center = true);
    }
}

// Module for flange plate
module flange_plate() {
    difference() {
        cylinder(h = flange_thickness, d = flange_diameter, center = true);
        for (i = [0:3]) {
            rotate([0, 0, i * 90])
                translate([bolt_spacing / 2, 0, 0])
                cylinder(h = flange_thickness + 2, d = bolt_hole_diameter, center = true);
        }
    }
}

// Module for flexible element
module flexible_element() {
    translate([0, 0, -flexible_element_thickness / 2])
        cube([flexible_element_length, flexible_element_width, flexible_element_thickness], center = true);
}

// Module for bolt
module bolt() {
    cylinder(h = bolt_length, d = bolt_diameter, center = true);
}

// Module for nut
module nut() {
    cylinder(h = nut_thickness, d = nut_diameter, $fn = 6, center = true);
}

// Assembly
module flexible_coupling() {
    // Input shaft
    translate([0, 0, -shaft_length / 2 - flange_thickness])
        shaft();

    // First flange plate
    translate([0, 0, -flange_thickness / 2])
        flange_plate();

    // First flexible element
    translate([0, 0, flexible_element_thickness])
        flexible_element();

    // Second flange plate
    translate([0, 0, flange_thickness / 2 + flexible_element_thickness * 2])
        flange_plate();

    // Second flexible element
    translate([0, 0, flange_thickness + flexible_element_thickness * 3])
        flexible_element();

    // Output shaft
    translate([0, 0, shaft_length / 2 + flange_thickness])
        shaft();

    // Bolts and nuts
    for (i = [0:3]) {
        rotate([0, 0, i * 90]) {
            translate([bolt_spacing / 2, 0, 0]) {
                translate([0, 0, -bolt_length / 2])
                    bolt();
                translate([0, 0, bolt_length / 2])
                    nut();
            }
        }
    }
}

// Render the model
flexible_coupling();

