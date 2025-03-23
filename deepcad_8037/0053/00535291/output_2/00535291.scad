
// Define dimensions for the base_block
base_block_length = 50;  // Length of the rectangular prism
base_block_width = 50;   // Width of the rectangular prism
base_block_height = 25;  // Adjusted height to match the original model

// Define corner radius for smoother edges
corner_radius = 2;  // Radius for rounded edges

// Create the base_block with rounded edges
translate([0, 0, 0]) {
    hull() {
        for (x = [0, base_block_length]) {
            for (y = [0, base_block_width]) {
                for (z = [0, base_block_height]) {
                    translate([x, y, z]) sphere(corner_radius);
                }
            }
        }
    }
}

// Ensure uniform orientation
// Removed unnecessary rotation to ensure the base block remains flat and aligned
// The base block is already aligned uniformly, so no rotation is applied

