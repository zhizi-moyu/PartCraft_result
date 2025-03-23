
// Parameters for the blocks
central_block_size = 20; // Size of the central block (cube)
spacer_block_size = 15;  // Size of the spacer blocks (cube)
hole_diameter = 10;      // Diameter of the cylindrical hole
hole_radius = hole_diameter / 2;

// Function to create a block with a cylindrical hole
module block_with_hole(block_size) {
    difference() {
        // Create the cube
        cube([block_size, block_size, block_size], center = true);
        // Subtract the cylindrical hole
        rotate([90, 0, 0]) {
            cylinder(h = block_size + 2, r = hole_radius, center = true);
        }
    }
}

// Assembly of the flexible coupling
module flexible_coupling() {
    // Layer 1: Spacer block 1
    translate([0, 0, spacer_block_size / 2 + central_block_size / 2]) {
        block_with_hole(spacer_block_size);
    }
    
    // Layer 2: Central block
    translate([0, 0, 0]) {
        block_with_hole(central_block_size);
    }
    
    // Layer 3: Spacer block 2
    translate([0, 0, -(spacer_block_size / 2 + central_block_size / 2)]) {
        block_with_hole(spacer_block_size);
    }
}

// Render the flexible coupling
flexible_coupling();

