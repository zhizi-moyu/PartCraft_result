
// Parameters
outer_shell_diameter = 60;
outer_shell_thickness = 5;
outer_shell_height = 20;

spacer_ring_thickness = 2;
spacer_ring_inner_diameter = 40;
spacer_ring_outer_diameter = outer_shell_diameter - 2 * outer_shell_thickness;

inner_hub_diameter = 30;
inner_hub_height = 15;
inner_hub_teeth_count = 12;
inner_hub_teeth_depth = 2;

bolt_diameter = 3;
bolt_length = outer_shell_height + 5;
bolt_spacing_radius = (spacer_ring_inner_diameter + spacer_ring_outer_diameter) / 4;

nut_diameter = 5;
nut_thickness = 3;

// Outer Cylindrical Shell
module outer_cylindrical_shell() {
    difference() {
        cylinder(h = outer_shell_height, d = outer_shell_diameter, $fn = 100);
        translate([0, 0, -1])
            cylinder(h = outer_shell_height + 2, d = outer_shell_diameter - 2 * outer_shell_thickness, $fn = 100);
    }
}

// Spacer Ring
module spacer_ring() {
    difference() {
        cylinder(h = spacer_ring_thickness, d = spacer_ring_outer_diameter, $fn = 100);
        translate([0, 0, -1])
            cylinder(h = spacer_ring_thickness + 2, d = spacer_ring_inner_diameter, $fn = 100);
    }
}

// Inner Hub with Teeth
module inner_hub_with_teeth() {
    difference() {
        cylinder(h = inner_hub_height, d = inner_hub_diameter, $fn = 100);
        translate([0, 0, -1])
            cylinder(h = inner_hub_height + 2, d = inner_hub_diameter - 2 * inner_hub_teeth_depth, $fn = 100);
        for (i = [0:360/inner_hub_teeth_count:360-360/inner_hub_teeth_count]) {
            rotate([0, 0, i])
                translate([inner_hub_diameter / 2 - inner_hub_teeth_depth / 2, 0, 0])
                    cube([inner_hub_teeth_depth, inner_hub_teeth_depth, inner_hub_height + 2], center = true);
        }
    }
}

// Bolt
module bolt() {
    cylinder(h = bolt_length, d = bolt_diameter, $fn = 50);
}

// Nut
module nut() {
    difference() {
        cylinder(h = nut_thickness, d = nut_diameter, $fn = 6);
        translate([0, 0, -1])
            cylinder(h = nut_thickness + 2, d = bolt_diameter, $fn = 50);
    }
}

// Assembly
module assembly() {
    // Layer 1: Outer Cylindrical Shell
    outer_cylindrical_shell();

    // Layer 2: Spacer Ring
    translate([0, 0, outer_shell_height / 2 - spacer_ring_thickness / 2])
        spacer_ring();

    // Layer 3: Inner Hub with Teeth
    translate([0, 0, outer_shell_height / 2 - inner_hub_height / 2])
        inner_hub_with_teeth();

    // Layer 4: Bolts and Nuts
    for (i = [0:360/8:360-360/8]) {
        rotate([0, 0, i]) {
            translate([bolt_spacing_radius, 0, outer_shell_height / 2 - bolt_length / 2])
                bolt();
            translate([bolt_spacing_radius, 0, outer_shell_height / 2 + bolt_length / 2 - nut_thickness])
                nut();
        }
    }
}

// Render the assembly
assembly();

