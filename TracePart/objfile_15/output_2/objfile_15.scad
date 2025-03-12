
// Parameters
clamp_radius = 15;
clamp_length = 10;
clamp_thickness = 5;
bolt_hole_radius = 2;
shaft_hole_radius = 5;
bolt_radius = 2;
bolt_length = 15;
nut_radius = 3;
nut_thickness = 2;
flexible_element_thickness = 3;
flexible_element_gap = 2;
cutout_depth = 3;
cutout_radius = 5;
cutout_spacing = 6; // Adjusted for better cutout placement

// Function to create a clamp half with detailed cutouts
module clamp_half() {
    difference() {
        union() {
            cylinder(h = clamp_length, r = clamp_radius);
            translate([0, 0, -clamp_thickness])
                cylinder(h = clamp_thickness, r = clamp_radius + 2);
        }
        // Shaft hole
        translate([0, 0, -1])
            cylinder(h = clamp_length + 2, r = shaft_hole_radius);
        // Bolt holes
        for (i = [0:120:360]) {
            rotate([0, 0, i])
                translate([clamp_radius - 3, 0, clamp_length / 2])
                    cylinder(h = clamp_length + 2, r = bolt_hole_radius);
        }
        // Curved cutouts for flexibility
        for (i = [0:120:360]) {
            rotate([0, 0, i])
                translate([clamp_radius - cutout_radius, 0, clamp_length / 2])
                    cylinder(h = clamp_length + 2, r = cutout_radius);
        }
        // Additional detailing for curvature
        for (i = [0:120:360]) {
            rotate([0, 0, i])
                translate([clamp_radius - cutout_spacing, 0, clamp_length / 2])
                    cylinder(h = clamp_length + 2, r = cutout_radius / 2);
        }
    }
}

// Function to create a flexible element with more defined curvature
module flexible_element() {
    difference() {
        cylinder(h = flexible_element_thickness, r = clamp_radius - 2);
        translate([0, 0, -1])
            cylinder(h = flexible_element_thickness + 2, r = shaft_hole_radius);
        // Adding curved recesses for flexibility
        for (i = [0:120:360]) {
            rotate([0, 0, i])
                translate([clamp_radius - cutout_radius, 0, 0])
                    cylinder(h = flexible_element_thickness, r = cutout_radius);
        }
    }
}

// Function to create a bolt
module bolt() {
    translate([0, 0, -bolt_length / 2])
        cylinder(h = bolt_length, r = bolt_radius);
}

// Function to create a nut with recess
module nut() {
    difference() {
        cylinder(h = nut_thickness, r = nut_radius, $fn = 6);
        translate([0, 0, -1])
            cylinder(h = nut_thickness + 2, r = nut_radius - 1);
    }
}

// Assembly
module coupling() {
    // Top clamp halves
    translate([0, 0, clamp_length + flexible_element_gap])
        clamp_half();
    mirror([1, 0, 0])
        translate([0, 0, clamp_length + flexible_element_gap])
            clamp_half();
    
    // Bolts and nuts (top layer)
    for (i = [0:120:360]) {
        rotate([0, 0, i])
            translate([clamp_radius - 3, 0, clamp_length + flexible_element_gap])
                bolt();
        rotate([0, 0, i])
            translate([clamp_radius - 3, 0, clamp_length + flexible_element_gap + bolt_length])
                nut();
    }

    // Flexible element (top)
    translate([0, 0, flexible_element_gap])
        flexible_element();

    // Bottom clamp halves
    translate([0, 0, -clamp_length - flexible_element_gap])
        clamp_half();
    mirror([1, 0, 0])
        translate([0, 0, -clamp_length - flexible_element_gap])
            clamp_half();

    // Bolts and nuts (bottom layer)
    for (i = [0:120:360]) {
        rotate([0, 0, i])
            translate([clamp_radius - 3, 0, -clamp_length - flexible_element_gap])
                bolt();
        rotate([0, 0, i])
            translate([clamp_radius - 3, 0, -clamp_length - flexible_element_gap - bolt_length])
                nut();
    }

    // Flexible element (bottom)
    translate([0, 0, -clamp_length - 2 * flexible_element_gap])
        flexible_element();
}

// Render the coupling
coupling();

