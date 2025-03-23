
// Parameters
central_block_length = 40;
central_block_width = 20;
central_block_height = 10;
hole_diameter = 5;
hole_offset = 10;

side_block_length = 20;
side_block_width = 20;
side_block_height = 10;
side_block_curve_radius = 5; // Adjusted curvature to match original model

bolt_diameter = 5;
bolt_length = 10; // Shortened bolt length to match original model

nut_diameter = 6; // Adjusted nut size to match original model
nut_thickness = 4;

// Central Block
module central_block() {
    difference() {
        cube([central_block_length, central_block_width, central_block_height], center = true);
        translate([-central_block_length/2 + hole_offset, 0, 0])
            rotate([0, 90, 0])
            cylinder(r = hole_diameter/2, h = central_block_width + 2, center = true);
        translate([central_block_length/2 - hole_offset, 0, 0])
            rotate([0, 90, 0])
            cylinder(r = hole_diameter/2, h = central_block_width + 2, center = true);
    }
}

// Side Block
module side_block() {
    difference() {
        hull() {
            translate([-side_block_length/2, -side_block_width/2, 0])
                cube([side_block_length, side_block_width, side_block_height]);
            translate([0, 0, side_block_height])
                sphere(r = side_block_curve_radius);
        }
        translate([-side_block_length/2 + hole_offset, 0, side_block_height/2])
            rotate([0, 90, 0])
            cylinder(r = hole_diameter/2, h = side_block_width + 2, center = true);
    }
}

// Bolt
module bolt() {
    cylinder(r = bolt_diameter/2, h = bolt_length, center = false);
}

// Nut
module nut() {
    difference() {
        cylinder(r = nut_diameter/2, h = nut_thickness, center = false);
        translate([0, 0, nut_thickness/2])
            cylinder(r = bolt_diameter/2, h = nut_thickness + 2, center = true);
    }
}

// Assembly
module assembly() {
    // Central Block
    central_block();

    // Side Blocks
    translate([-central_block_length/2 - side_block_length/2, 0, 0])
        side_block();
    translate([central_block_length/2 + side_block_length/2, 0, 0])
        mirror([1, 0, 0])
            side_block();

    // Bolts and Nuts
    for (i = [-1, 1]) {
        translate([i * (central_block_length/2 - hole_offset), 0, 0]) {
            rotate([90, 0, 0])
                bolt();
            translate([0, 0, bolt_length])
                nut();
        }
    }
}

// Render the assembly
assembly();

