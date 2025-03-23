
// Define the dimensions of a single rectangular block
block_size = [20, 20, 10]; // [width, depth, height]

// Function to create a rectangular block
module rectangular_block() {
    cube(block_size, center = true);
}

// Assemble the blocks into layers based on the graph_dict
module flexible_coupling() {
    // Layer 1: rectangular_block_6 (topmost layer)
    translate([0, 0, 25]) rectangular_block();
    
    // Layer 2: rectangular_block_5
    translate([0, 0, 15]) rectangular_block();
    
    // Layer 3: rectangular_block_4
    translate([0, 0, 5]) rectangular_block();
    
    // Layer 4: rectangular_block_3
    translate([0, 0, -5]) rectangular_block();
    
    // Layer 5: rectangular_block_2
    translate([0, 0, -15]) rectangular_block();
    
    // Layer 6: rectangular_block_1 (bottommost layer)
    translate([0, 0, -25]) rectangular_block();
}

// Render the flexible coupling
flexible_coupling();

