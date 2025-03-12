
// Parameters
flange_diameter = 60;
flange_thickness = 5;
hub_diameter = 30;
hub_length = 20;
bore_diameter = 15;
bolt_hole_diameter = 5;
bolt_count = 6;
bolt_length = 15;
bolt_diameter = 4;
nut_diameter = 6;
nut_thickness = 3;
bolt_circle_diameter = 40;

// Module for the flange
module flange() {
    difference() {
        cylinder(d=flange_diameter, h=flange_thickness, center=true);
        cylinder(d=bore_diameter, h=flange_thickness + 2, center=true);
        for (i = [0:bolt_count-1]) {
            angle = i * 360 / bolt_count;
            x = bolt_circle_diameter / 2 * cos(angle);
            y = bolt_circle_diameter / 2 * sin(angle);
            translate([x, y, 0])
                cylinder(d=bolt_hole_diameter, h=flange_thickness + 2, center=true);
        }
    }
}

// Module for the hub
module hub() {
    difference() {
        cylinder(d=hub_diameter, h=hub_length, center=true);
        cylinder(d=bore_diameter, h=hub_length + 2, center=true);
    }
}

// Module for a single bolt
module bolt() {
    union() {
        cylinder(d=bolt_diameter, h=bolt_length, center=true);
        translate([0, 0, bolt_length/2])
            cylinder(d=nut_diameter, h=nut_thickness, center=true, $fn=6);
    }
}

// Module for assembling the coupling
module coupling() {
    flange();
    translate([0, 0, flange_thickness/2 + hub_length/2])
        hub();
    for (i = [0:bolt_count-1]) {
        angle = i * 360 / bolt_count;
        x = bolt_circle_diameter / 2 * cos(angle);
        y = bolt_circle_diameter / 2 * sin(angle);
        translate([x, y, flange_thickness/2])
            rotate([0, 0, angle])
                bolt();
    }
}

// Render the coupling
coupling();

