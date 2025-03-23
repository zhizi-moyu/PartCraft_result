
// Parameters
block_length = 40; // Length of the central block
block_width = 20;  // Width of the central block
block_height = 10; // Height of the central block
hole_diameter = 10; // Adjusted diameter of the circular holes to match the original model
hole_spacing = 22; // Adjusted spacing between the centers of the holes to match the original model
corner_radius = 6; // Adjusted radius for rounded edges to match the original model

// Central block module
module central_block() {
    // Create the main block with rounded edges
    difference() {
        // Rounded rectangular block
        minkowski() {
            cube([block_length - 2 * corner_radius, block_width - 2 * corner_radius, block_height], center = true);
            sphere(corner_radius);
        }
        // Subtract the two circular holes
        for (i = [-hole_spacing / 2, hole_spacing / 2]) {
            translate([i, 0, 0])
                cylinder(h = block_height + 1, r = hole_diameter / 2, center = true);
        }
    }
}

// Spacer block module
module spacer_block() {
    spacer_length = 15; // Adjusted length to match the compact dimensions of the original model
    spacer_width = 10;  // Adjusted width to match the original model
    spacer_height = 5;  // Adjusted height to match the original model
    spacer_hole_diameter = 10; // Diameter of the holes in the spacer block

    difference() {
        // Rounded rectangular spacer block
        minkowski() {
            cube([spacer_length - 2 * corner_radius, spacer_width - 2 * corner_radius, spacer_height], center = true);
            sphere(corner_radius);
        }
        // Subtract the two circular holes
        for (i = [-hole_spacing / 2, hole_spacing / 2]) {
            translate([i, 0, 0])
                cylinder(h = spacer_height + 1, r = spacer_hole_diameter / 2, center = true);
        }
    }
}

// Bolt module (placeholder, as no specific details are provided)
module bolt() {
    bolt_length = 20; // Placeholder length
    bolt_diameter = 5; // Placeholder diameter
    cylinder(h = bolt_length, r = bolt_diameter / 2, center = false);
}

// Nut module (placeholder, as no specific details are provided)
module nut() {
    nut_diameter = 8; // Placeholder diameter
    nut_thickness = 3; // Placeholder thickness
    difference() {
        cylinder(h = nut_thickness, r = nut_diameter / 2, center = false);
        translate([0, 0, -1])
            cylinder(h = nut_thickness + 2, r = bolt_diameter / 2, center = false);
    }
}

// Render the central block
central_block();

// Render the spacer block
translate([0, 0, -15]) spacer_block();

// Render the bolt
translate([hole_spacing / 2, 0, -20]) bolt();
translate([-hole_spacing / 2, 0, -20]) bolt();

// Render the nut
translate([hole_spacing / 2, 0, -25]) nut();
translate([-hole_spacing / 2, 0, -25]) nut();

