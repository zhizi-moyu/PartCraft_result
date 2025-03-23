```scad
// Spacer Block Parameters
spacer_length = 20; // Length of the block
spacer_width = 10;  // Width of the block
spacer_height = 15; // Height of the block
hole_diameter = 6;  // Diameter of the circular holes
hole_spacing = 12;  // Distance between the centers of the two holes

// Spacer Block Module
module spacer_block() {
    // Main block
    difference() {
        // Create the rectangular block
        rounded_block(spacer_length, spacer_width, spacer_height, corner_radius=2);
        
        // Create the two circular holes
        translate([spacer_length / 2 - hole_spacing / 2, spacer_width / 2, spacer_height / 2])
            rotate([90, 0, 0])
            cylinder(h=spacer_width + 2, d=hole_diameter, center=true);
        
        translate([spacer_length / 2 + hole_spacing / 2, spacer_width / 2, spacer_height / 2])
            rotate([90, 0, 0])
            cylinder(h=spacer_width + 2, d=hole_diameter, center=true);
    }
}

// Helper Module for Rounded Block
module rounded_block(length, width, height, corner_radius) {
    minkowski() {
        cube([length - 2 * corner_radius, width - 2 * corner_radius, height - 2 * corner_radius], center=true);
        sphere(r=corner_radius);
    }
}

// Render the Spacer Block
spacer_block();
```

