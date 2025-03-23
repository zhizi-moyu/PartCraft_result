
// Parameters
central_cylinder_diameter = 40; // Diameter of the central cylinder
central_cylinder_length = 60;  // Length of the central cylinder
spacer_ring_outer_diameter = 50; // Outer diameter of the spacer ring
spacer_ring_inner_diameter = 40; // Inner diameter of the spacer ring
spacer_ring_thickness = 5;      // Thickness of the spacer ring
flange_plate_outer_diameter = 60; // Outer diameter of the flange plate
flange_plate_inner_diameter = 40; // Inner diameter of the flange plate
flange_plate_thickness = 5;      // Thickness of the flange plate
bolt_diameter = 5;               // Diameter of the bolt
bolt_length = 70;                // Length of the bolt
nut_diameter = 8;                // Diameter of the nut
nut_thickness = 5;               // Thickness of the nut
bolt_hole_radius = 3;            // Radius of the bolt holes
bolt_hole_spacing = 20;          // Distance from the center to the bolt holes

// Central Cylinder
module central_cylinder() {
    difference() {
        cylinder(h = central_cylinder_length, d = central_cylinder_diameter);
        translate([0, 0, -1])
            cylinder(h = central_cylinder_length + 2, d = spacer_ring_inner_diameter);
    }
}

// Spacer Ring
module spacer_ring() {
    difference() {
        cylinder(h = spacer_ring_thickness, d = spacer_ring_outer_diameter);
        translate([0, 0, -1])
            cylinder(h = spacer_ring_thickness + 2, d = spacer_ring_inner_diameter);
    }
}

// Flange Plate
module flange_plate() {
    difference() {
        cylinder(h = flange_plate_thickness, d = flange_plate_outer_diameter);
        translate([0, 0, -1])
            cylinder(h = flange_plate_thickness + 2, d = flange_plate_inner_diameter);
        for (i = [0:3]) {
            rotate([0, 0, i * 90])
                translate([bolt_hole_spacing, 0, -1])
                    cylinder(h = flange_plate_thickness + 2, r = bolt_hole_radius);
        }
    }
}

// Bolt
module bolt() {
    cylinder(h = bolt_length, d = bolt_diameter);
}

// Nut
module nut() {
    cylinder(h = nut_thickness, d = nut_diameter);
}

// Assembly
module flexible_coupling() {
    // Central Cylinder
    central_cylinder();

    // Spacer Rings
    translate([0, 0, central_cylinder_length / 2 - spacer_ring_thickness / 2])
        spacer_ring();
    translate([0, 0, -central_cylinder_length / 2 + spacer_ring_thickness / 2])
        spacer_ring();

    // Flange Plates
    translate([0, 0, central_cylinder_length / 2 + spacer_ring_thickness])
        flange_plate();
    translate([0, 0, -central_cylinder_length / 2 - spacer_ring_thickness])
        flange_plate();

    // Bolts and Nuts
    for (i = [0:3]) {
        rotate([0, 0, i * 90]) {
            translate([bolt_hole_spacing, 0, central_cylinder_length / 2 + spacer_ring_thickness + flange_plate_thickness])
                bolt();
            translate([bolt_hole_spacing, 0, central_cylinder_length / 2 + spacer_ring_thickness + flange_plate_thickness + bolt_length])
                nut();
            translate([bolt_hole_spacing, 0, -central_cylinder_length / 2 - spacer_ring_thickness - flange_plate_thickness - bolt_length])
                bolt();
            translate([bolt_hole_spacing, 0, -central_cylinder_length / 2 - spacer_ring_thickness - flange_plate_thickness - bolt_length - nut_thickness])
                nut();
        }
    }
}

// Render the flexible coupling
flexible_coupling();

