
// Define dimensions
cube_size = 20; // Size of the solid cube
block_width = 30; // Width of the rectangular block
block_height = 40; // Height of the rectangular block
block_depth = 20; // Depth of the rectangular block
hole_diameter = 10; // Diameter of the holes
hole_spacing = 15; // Distance between the centers of the holes

// Solid cube
module solid_cube() {
    cube([cube_size, cube_size, cube_size], center = true);
}

// Rectangular block with two holes
module rectangular_block_with_two_holes() {
    difference() {
        cube([block_width, block_depth, block_height], center = true);
        // Create the two holes
        translate([-block_width / 2 + hole_spacing, 0, 0])
            cylinder(h = block_height + 1, r = hole_diameter / 2, center = true);
        translate([block_width / 2 - hole_spacing, 0, 0])
            cylinder(h = block_height + 1, r = hole_diameter / 2, center = true);
    }
}

// Assembly
module assembly() {
    // Layer 1: Solid cube
    translate([0, 0, block_height / 2 + cube_size / 2])
        solid_cube();
    // Layer 2: Rectangular block with two holes
    translate([0, 0, -block_height / 2])
        rectangular_block_with_two_holes();
}

// Render the assembly
assembly();

