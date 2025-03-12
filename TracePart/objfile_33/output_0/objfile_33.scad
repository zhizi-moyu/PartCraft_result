
// Parameters
hub_diameter = 40;
hub_length = 20;
shaft_hole_diameter = 10;
bolt_hole_diameter = 5;
bolt_circle_diameter = 30;
num_bolts = 6;
flexible_element_thickness = 5;
flexible_element_wavy_depth = 3;

// Function to create a hub
module hub() {
    difference() {
        cylinder(d=hub_diameter, h=hub_length, center=true);
        cylinder(d=shaft_hole_diameter, h=hub_length + 2, center=true);
        
        for (i = [0:num_bolts-1]) {
            angle = i * 360 / num_bolts;
            x = bolt_circle_diameter / 2 * cos(angle);
            y = bolt_circle_diameter / 2 * sin(angle);
            translate([x, y, 0])
                cylinder(d=bolt_hole_diameter, h=hub_length + 2, center=true);
        }
    }
}

// Function to create the flexible element
module flexible_element() {
    difference() {
        cylinder(d=hub_diameter, h=flexible_element_thickness, center=true);
        
        for (i = [0:num_bolts-1]) {
            angle = i * 360 / num_bolts;
            x = bolt_circle_diameter / 2 * cos(angle);
            y = bolt_circle_diameter / 2 * sin(angle);
            translate([x, y, 0])
                cylinder(d=bolt_hole_diameter, h=flexible_element_thickness + 2, center=true);
        }
    }
    
    for (i = [0:num_bolts-1]) {
        angle = i * 360 / num_bolts;
        x = bolt_circle_diameter / 2 * cos(angle);
        y = bolt_circle_diameter / 2 * sin(angle);
        translate([x, y, 0])
            rotate([0, 0, angle])
                translate([-flexible_element_wavy_depth, -flexible_element_thickness/2, 0])
                    cube([flexible_element_wavy_depth * 2, flexible_element_thickness, flexible_element_thickness]);
    }
}

// Function to create a fastening bolt
module bolt() {
    cylinder(d=bolt_hole_diameter, h=hub_length * 2 + flexible_element_thickness, center=true);
}

// Function to create a nut
module nut() {
    cylinder(d=bolt_hole_diameter * 1.5, h=bolt_hole_diameter, center=true);
}

// Assembly
module coupling() {
    translate([0, 0, -hub_length - flexible_element_thickness/2])
        hub();
    
    translate([0, 0, flexible_element_thickness/2])
        flexible_element();
    
    translate([0, 0, hub_length + flexible_element_thickness/2])
        hub();
    
    for (i = [0:num_bolts-1]) {
        angle = i * 360 / num_bolts;
        x = bolt_circle_diameter / 2 * cos(angle);
        y = bolt_circle_diameter / 2 * sin(angle);
        
        translate([x, y, 0])
            bolt();
        
        translate([x, y, -hub_length - flexible_element_thickness/2])
            nut();
        
        translate([x, y, hub_length + flexible_element_thickness/2])
            nut();
    }
}

// Render the coupling
coupling();

