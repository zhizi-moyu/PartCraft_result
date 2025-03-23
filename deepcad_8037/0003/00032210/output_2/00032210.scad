
// Parameters
block_length = 60; // Length of the rectangular block
block_width = 30;  // Width of the rectangular block
block_height = 20; // Height of the rectangular block
hole_diameter = 10; // Diameter of the circular holes
hole_spacing_x = 40; // Spacing between holes along the length
hole_spacing_y = 20; // Spacing between holes along the width

// Rectangular block with holes
module rectangular_block() {
    difference() {
        // Main block
        cube([block_length, block_width, block_height], center = true);
        
        // Holes on the top and bottom faces
        for (x = [-hole_spacing_x / 2, hole_spacing_x / 2]) {
            for (y = [-hole_spacing_y / 2, hole_spacing_y / 2]) {
                translate([x, y, 0])
                    cylinder(h = block_height + 2, d = hole_diameter, center = true);
            }
        }
    }
}

// Assembly
module assembly() {
    // Rectangular block with holes
    rectangular_block();
}

// Render the assembly
assembly();

