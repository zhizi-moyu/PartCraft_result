
// Parameters for the central block
central_block_size = [20, 20, 30]; // Size of the central block (rectangular prism)
hole_diameter = 10;                // Diameter of the cylindrical hole
hole_radius = hole_diameter / 2;

// Function to create a block with a cylindrical hole
module block_with_hole(block_size) {
    difference() {
        // Create the block
        cube(block_size, center = true);
        // Subtract the cylindrical hole
        rotate([90, 0, 0]) {
            translate([0, 0, 0]) {
                cylinder(h = block_size[2] + 2, r = hole_radius, center = true);
            }
        }
    }
}

// Render the central block with a cylindrical hole
block_with_hole(central_block_size);

