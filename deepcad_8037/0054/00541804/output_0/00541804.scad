
// Parameters for the central block
central_block_length = 40;  // Length of the rectangular prism
central_block_width = 20;   // Width of the rectangular prism
central_block_height = 20;  // Height of the rectangular prism
hole_diameter = 10;         // Diameter of the circular hole

// Function to create the central block
module central_block() {
    difference() {
        // Create the rectangular prism
        cube([central_block_length, central_block_width, central_block_height], center = true);
        
        // Create the circular hole
        rotate([90, 0, 0])  // Rotate the cylinder to align with the block
        translate([0, 0, -central_block_length / 2])  // Position the hole in the center
        cylinder(h = central_block_length + 2, d = hole_diameter, center = true);
    }
}

// Render the central block
central_block();

