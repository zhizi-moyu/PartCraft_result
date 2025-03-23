
// Define the size of each cube
cube_size = 20; // Length of each edge of the cube

// Create the vertical stack of cubes
module flexible_coupling() {
    // Layer 1: cube_1
    translate([0, 0, cube_size * 5]) // Position at the topmost layer
    cube([cube_size, cube_size, cube_size]);

    // Layer 2: cube_2
    translate([0, 0, cube_size * 4]) // Position directly below cube_1
    cube([cube_size, cube_size, cube_size]);

    // Layer 3: cube_3
    translate([0, 0, cube_size * 3]) // Position directly below cube_2
    cube([cube_size, cube_size, cube_size]);

    // Layer 4: cube_4
    translate([0, 0, cube_size * 2]) // Position directly below cube_3
    cube([cube_size, cube_size, cube_size]);

    // Layer 5: cube_5
    translate([0, 0, cube_size * 1]) // Position directly below cube_4
    cube([cube_size, cube_size, cube_size]);

    // Layer 6: cube_6
    translate([0, 0, cube_size * 0]) // Position at the bottommost layer
    cube([cube_size, cube_size, cube_size]);
}

// Render the flexible coupling
flexible_coupling();

