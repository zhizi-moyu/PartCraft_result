```scad
// Dimensions for the rectangular block
block_length = 40;  // Length of the block
block_width = 20;   // Width of the block
block_height = 60;  // Height of the block

// Dimensions for the circular hole
hole_diameter = 10; // Diameter of the hole

// Main module to create the rectangular block with a circular hole
module rectangular_block() {
    // Create the rectangular block
    difference() {
        // Base block
        cube([block_length, block_width, block_height], center = true);
        
        // Circular hole
        rotate([90, 0, 0])  // Align the hole perpendicular to the largest face
        translate([0, 0, 0])  // Ensure the hole is perfectly centered
        cylinder(r = hole_diameter / 2, h = block_length + 2, center = true);
    }
}

// Call the module to render the model
rectangular_block();
```

