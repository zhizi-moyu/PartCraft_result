// Define the dimensions of rectangular blocks
block_sizes = [
    [30, 30, 30],  // rectangular_block_1: [width, depth, height]
    [30, 30, 30],  // rectangular_block_2: [width, depth, height]
    [30, 30, 30],  // rectangular_block_3: [width, depth, height]
    [30, 30, 30],  // rectangular_block_4: [width, depth, height]
    [30, 30, 30],  // rectangular_block_5: [width, depth, height]
    [30, 30, 30]   // rectangular_block_6: [width, depth, height]
];

// Function to create a rectangular block with specific dimensions
module rectangular_block(size) {
    cube(size, center = true);
}

// Assemble the blocks into layers based on the graph_dict
module flexible_coupling() {
    // Layer 1: rectangular_block_6 (topmost layer)
    translate([0, 0, 75]) rectangular_block(block_sizes[5]);
    
    // Layer 2: rectangular_block_5
    translate([0, 0, 45]) rectangular_block(block_sizes[4]);
    
    // Layer 3: rectangular_block_4
    translate([0, 0, 15]) rectangular_block(block_sizes[3]);
    
    // Layer 4: rectangular_block_3
    translate([0, 0, -15]) rectangular_block(block_sizes[2]);
    
    // Layer 5: rectangular_block_2
    translate([0, 0, -45]) rectangular_block(block_sizes[1]);
    
    // Layer 6: rectangular_block_1 (bottommost layer)
    translate([0, 0, -75]) rectangular_block(block_sizes[0]);
}

// Render the flexible coupling
flexible_coupling();
