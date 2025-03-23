
// Parameters
block_length = 40; // Length of the central block
block_width = 20;  // Width of the central block
block_height = 10; // Height of the central block
hole_diameter = 8; // Diameter of the circular holes
hole_spacing = 20; // Distance between the centers of the holes
corner_radius = 5; // Radius for rounded edges

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

// Render the central block
central_block();

