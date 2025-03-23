
// Define dimensions
cube_size = 20; // Size of the cube
hole_diameter = 10; // Diameter of the cylindrical hole
hole_radius = hole_diameter / 2; // Radius of the cylindrical hole
layer_height = cube_size; // Height of each layer

// Function to create a cube block with a cylindrical hole
module cube_block_with_cylindrical_hole() {
    difference() {
        cube([cube_size, cube_size, cube_size], center = true);
        cylinder(r = hole_radius, h = cube_size * 2, center = true); // Smooth and uniform cylindrical hole
    }
}

// Function to create a solid cube block
module empty_cube_block() {
    cube([cube_size, cube_size, cube_size], center = true);
}

// Assemble the model based on the graph_dict
translate([0, 0, layer_height * 3]) cube_block_with_cylindrical_hole(); // Layer 1
translate([0, 0, layer_height * 2]) cube_block_with_cylindrical_hole(); // Layer 2
translate([0, 0, layer_height * 1]) cube_block_with_cylindrical_hole(); // Layer 3
translate([0, 0, 0]) empty_cube_block(); // Layer 4
translate([0, 0, -layer_height * 1]) cube_block_with_cylindrical_hole(); // Layer 5
translate([0, 0, -layer_height * 2]) cube_block_with_cylindrical_hole(); // Layer 6
translate([0, 0, -layer_height * 3]) cube_block_with_cylindrical_hole(); // Layer 7

