
// Function to create the original central block with protruding extensions
module central_block_original() {
    difference() {
        // Main rectangular block
        cube([40, 20, 5], center = true);
        
        // Protruding rectangular extensions
        translate([-25, 0, 0]) cube([10, 20, 5], center = true);
        translate([25, 0, 0]) cube([10, 20, 5], center = true);
        
        // Central cylindrical hole
        cylinder(h = 5, r = 5, center = true);
    }
}

// Generate the 3D model
central_block_original();

