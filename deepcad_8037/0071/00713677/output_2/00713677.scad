
// Define the dimensions of the rectangular blocks
block_width = 20;  // Width of the block
block_height = 40; // Height of the block
block_depth = 10;  // Depth of the block

// Function to create a rectangular block
module rectangular_block(width, height, depth, slant_top = false, slant_side = false, rotation = [0, 0, 0]) {
    if (slant_top) {
        // Create a block with a slanted top surface
        polyhedron(points=[
            [0, 0, 0], [width, 0, 0], [width, depth, 0], [0, depth, 0], // Base vertices
            [0, 0, height], [width, 0, height], [width, depth, height], [0, depth, height] // Top vertices (adjusted to be flat)
        ],
        faces=[
            [0, 1, 2, 3], // Base
            [4, 5, 6, 7], // Top
            [0, 1, 5, 4], // Side 1
            [1, 2, 6, 5], // Side 2
            [2, 3, 7, 6], // Side 3
            [3, 0, 4, 7]  // Side 4
        ]);
    } else if (slant_side) {
        // Create a block with a slanted side surface
        polyhedron(points=[
            [0, 0, 0], [width, 0, 0], [width, depth, 0], [0, depth, 0], // Base vertices
            [0, 0, height], [width, 0, height], [width, depth, height], [0, depth, height] // Top vertices (adjusted to be straight)
        ],
        faces=[
            [0, 1, 2, 3], // Base
            [4, 5, 6, 7], // Top
            [0, 1, 5, 4], // Side 1
            [1, 2, 6, 5], // Side 2
            [2, 3, 7, 6], // Side 3
            [3, 0, 4, 7]  // Side 4
        ]);
    } else {
        // Create a regular rectangular block
        cube([width, depth, height], center = true);
    }
    rotate(rotation) {
        translate([0, 0, height / 2]) {
            cube([width, depth, height], center = true);
        }
    }
}

// Generate six rectangular blocks with modifications based on the differences list

// Block 1: Adjust the top surface to be flat and parallel to the base
rectangular_block(block_width, block_height, block_depth, slant_top = false);

// Block 2: Reduce the height and increase the width
rectangular_block(block_width + 10, block_height - 10, block_depth);

// Block 3: Adjust the slanted side surface to be perpendicular to the base
rectangular_block(block_width, block_height, block_depth, slant_side = false);

// Block 4: Align the block to be upright and parallel to the axes
rectangular_block(block_width, block_height, block_depth, rotation = [0, 0, 0]);

// Block 5: Increase the dimensions to match the size of the original block
rectangular_block(block_width + 10, block_height + 10, block_depth + 5);

// Block 6: Adjust the shape to be symmetrical and consistent in dimensions
rectangular_block(block_width, block_height, block_depth);

