
// Parameters
clamp_diameter = 20;
clamp_height = 10;
shaft_hole_diameter = 6;
screw_hole_diameter = 3;
slit_width = 1;
flexible_element_thickness = 3;
pin_diameter = 3;
pin_length = 15;
screw_length = 8;
screw_offset = clamp_diameter / 2 - 2;

// Left Clamp
module left_clamp() {
    difference() {
        cylinder(d=clamp_diameter, h=clamp_height, center=true);
        cylinder(d=shaft_hole_diameter, h=clamp_height+2, center=true);
        translate([0, screw_offset, 0])
            cylinder(d=screw_hole_diameter, h=clamp_height+2, center=true);
        translate([0, -screw_offset, 0])
            cylinder(d=screw_hole_diameter, h=clamp_height+2, center=true);
        translate([0, 0, -clamp_height/2])
            cube([slit_width, clamp_diameter, clamp_height+2], center=true);
    }
}

// Right Clamp
module right_clamp() {
    left_clamp();
}

// Flexible Element
module flexible_element() {
    difference() {
        union() {
            translate([0, 0, -clamp_height])
                cylinder(d=clamp_diameter, h=flexible_element_thickness, center=true);
            translate([0, 0, -2*clamp_height])
                cylinder(d=clamp_diameter, h=flexible_element_thickness, center=true);
        }
        for (i = [-1, 0, 1]) {
            translate([i * clamp_diameter/3, 0, -1.5*clamp_height])
                rotate([0, 90, 0])
                cylinder(d=pin_diameter, h=clamp_diameter+2, center=true);
        }
        // Adding cutouts for flexibility
        for (i = [-1, 1]) {
            translate([i * clamp_diameter/4, 0, -1.5*clamp_height])
                rotate([0, 90, 0])
                cube([pin_diameter, clamp_diameter, flexible_element_thickness], center=true);
        }
    }
}

// Pin
module pin() {
    cylinder(d=pin_diameter, h=pin_length, center=true);
}

// Screw
module screw() {
    cylinder(d=screw_hole_diameter, h=screw_length, center=true);
}

// Assembly
module flexible_coupling() {
    translate([0, 0, clamp_height])
        left_clamp();
    translate([0, 0, -clamp_height])
        right_clamp();
    flexible_element();
    for (i = [-1, 0, 1]) {
        translate([i * clamp_diameter/3, 0, -1.5*clamp_height])
            pin();
    }
    translate([0, screw_offset, clamp_height])
        screw();
    translate([0, -screw_offset, clamp_height])
        screw();
}

// Render the model
flexible_coupling();

