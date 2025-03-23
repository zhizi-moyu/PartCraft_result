
// Function to create the modified central block with protruding extensions
module central_block_modified() {
    difference() {
        // Main unified rectangular block
        cube([40, 20, 5], center = true);
        
        // Protruding rectangular extensions
        translate([-25, 0, 0]) cube([10, 20, 5], center = true);
        translate([25, 0, 0]) cube([10, 20, 5], center = true);
        
        // Central cylindrical hole passing through the entire block
        cylinder(h = 5, r = 5, center = true);
    }
}

// Generate the 3D model
central_block_modified();

