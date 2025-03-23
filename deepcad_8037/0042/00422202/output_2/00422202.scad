// Parameters
cube_size = 50; // Size of the cube (length of each side)
hole_diameter = 20; // Diameter of the cylindrical hole

// Main module
module cube_block() {
    // Create the cube
    difference() {
        cube([cube_size, cube_size, cube_size], center=true); // Centered cube
        // Create the cylindrical hole
        translate([0, 0, 0]) // Ensure the cylinder is perfectly centered
        rotate([0, 0, 0]) // Ensure no rotation or skewing
        cylinder(h=cube_size, d=hole_diameter, center=true); // Centered cylinder
    }
}

// Render the cube block
cube_block();
