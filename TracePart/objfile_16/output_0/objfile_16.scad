
// Parameters
shaft_diameter = 10;
flange_diameter = 50;
flange_thickness = 5;
spacer_thickness = 3;
bolt_hole_diameter = 5;
bolt_diameter = 4;
bolt_length = 30;
nut_size = 8;
nut_thickness = 4;
num_bolts = 4;
bolt_circle_diameter = 35;
shaft_length = 20;

// Function to create a flange
module flange() {
    difference() {
        cylinder(d=flange_diameter, h=flange_thickness, center=true);
        cylinder(d=shaft_diameter, h=flange_thickness + 2, center=true);
        for (i = [0:num_bolts-1]) {
            angle = i * 360 / num_bolts;
            translate([bolt_circle_diameter/2 * cos(angle), bolt_circle_diameter/2 * sin(angle), 0])
                cylinder(d=bolt_hole_diameter, h=flange_thickness + 2, center=true);
        }
    }
}

// Function to create a spacer ring
module spacer_ring() {
    difference() {
        cylinder(d=flange_diameter, h=spacer_thickness, center=true);
        cylinder(d=bolt_circle_diameter, h=spacer_thickness + 2, center=true);
    }
}

// Function to create a bolt
module bolt() {
    union() {
        cylinder(d=bolt_diameter, h=bolt_length, center=true);
        translate([0, 0, bolt_length/2])
            cylinder(d=nut_size, h=nut_thickness, center=true);
    }
}

// Function to create the input/output craft
module craft() {
    union() {
        cylinder(d=shaft_diameter, h=shaft_length, center=true);
        translate([0, 0, shaft_length/2])
            flange();
    }
}

// Assemble the coupling
module coupling() {
    translate([0, 0, -shaft_length/2]) craft();
    translate([0, 0, shaft_length/2 + flange_thickness]) flange();
    translate([0, 0, shaft_length/2 + flange_thickness + spacer_thickness]) spacer_ring();
    translate([0, 0, shaft_length/2 + flange_thickness + 2 * spacer_thickness]) flange();
    translate([0, 0, shaft_length/2 + flange_thickness + 3 * spacer_thickness]) spacer_ring();
    translate([0, 0, shaft_length/2 + flange_thickness + 4 * spacer_thickness]) flange();
    translate([0, 0, shaft_length/2 + flange_thickness + 5 * spacer_thickness + shaft_length/2]) craft();
    
    // Bolts
    for (i = [0:num_bolts-1]) {
        angle = i * 360 / num_bolts;
        translate([bolt_circle_diameter/2 * cos(angle), bolt_circle_diameter/2 * sin(angle), shaft_length/2 + flange_thickness])
            rotate([90, 0, angle]) bolt();
    }
}

// Render the coupling
coupling();

