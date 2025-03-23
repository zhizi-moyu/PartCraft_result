
// Define dimensions for the rectangular blocks
block_width = 20;  // Width of the block
block_height = 10; // Height of the block
block_depth = 40;  // Depth of the block

// Define vertical spacing between blocks
spacing = 2; // Space between blocks

// Function to create a rectangular block
module rectangular_block() {
    cube([block_width, block_depth, block_height], center = true);
}

// Layer 1: rectangular_block_6
translate([0, 0, (block_height + spacing) * 2.5])
    rectangular_block();

// Layer 2: rectangular_block_5
translate([0, 0, (block_height + spacing) * 1.5])
    rectangular_block();

// Layer 3: rectangular_block_4
translate([0, 0, (block_height + spacing) * 0.5])
    rectangular_block();

// Layer 4: rectangular_block_3
translate([0, 0, -(block_height + spacing) * 0.5])
    rectangular_block();

// Layer 5: rectangular_block_2
translate([0, 0, -(block_height + spacing) * 1.5])
    rectangular_block();

// Layer 6: rectangular_block_1
translate([0, 0, -(block_height + spacing) * 2.5])
    rectangular_block();

