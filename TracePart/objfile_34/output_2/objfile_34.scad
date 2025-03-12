
// Parameters
outer_flange_diameter = 100;
outer_flange_thickness = 18; // Increased thickness for better structural integration
bolt_hole_diameter = 5;
num_bolts = 24;
bolt_circle_diameter = 80;

central_hub_diameter = 60;
central_hub_thickness = 40; // Increased height for a more pronounced cylindrical section
shaft_hole_diameter = 22;

inner_ring_diameter = 50; // Increased diameter for better alignment
inner_ring_thickness = 12; // Increased thickness for structural reinforcement
inner_ring_offset = -6; // Adjusted placement for proper alignment

bolt_length = 20; // Adjusted length for better integration
bolt_diameter = 5;
nut_diameter = 8;
nut_thickness = 6; // Adjusted thickness for secure fastening

// Outer Flange
module outer_flange() {
    difference() {
        cylinder(d=outer_flange_diameter, h=outer_flange_thickness, center=true);
        for (i = [0:num_bolts-1]) {
            angle = i * 360 / num_bolts;
            x = bolt_circle_diameter / 2 * cos(angle);
            y = bolt_circle_diameter / 2 * sin(angle);
            translate([x, y, 0]) cylinder(d=bolt_hole_diameter, h=outer_flange_thickness + 2, center=true);
        }
    }
}

// Central Hub
module central_hub() {
    difference() {
        union() {
            cylinder(d=central_hub_diameter, h=central_hub_thickness, center=true);
            translate([0, 0, -central_hub_thickness / 2]) cylinder(d=central_hub_diameter * 0.8, h=central_hub_thickness / 2, center=false);
        }
        cylinder(d=shaft_hole_diameter, h=central_hub_thickness + 2, center=true);
    }
}

// Inner Ring
module inner_ring() {
    difference() {
        cylinder(d=inner_ring_diameter, h=inner_ring_thickness, center=true);
        cylinder(d=shaft_hole_diameter, h=inner_ring_thickness + 2, center=true);
    }
}

// Bolt
module bolt() {
    cylinder(d=bolt_diameter, h=bolt_length, center=true);
}

// Nut
module nut() {
    cylinder(d=nut_diameter, h=nut_thickness, center=true, $fn=6);
}

// Assembly
module assembly() {
    translate([0, 0, outer_flange_thickness / 2]) outer_flange();
    
    for (i = [0:num_bolts-1]) {
        angle = i * 360 / num_bolts;
        x = bolt_circle_diameter / 2 * cos(angle);
        y = bolt_circle_diameter / 2 * sin(angle);
        translate([x, y, -bolt_length / 2]) bolt();
        translate([x, y, -bolt_length - nut_thickness / 2]) nut();
    }
    
    translate([0, 0, -central_hub_thickness / 2 - bolt_length]) central_hub();
    translate([0, 0, -central_hub_thickness - inner_ring_thickness / 2 - bolt_length + inner_ring_offset]) inner_ring();
}

// Render the assembly
assembly();

