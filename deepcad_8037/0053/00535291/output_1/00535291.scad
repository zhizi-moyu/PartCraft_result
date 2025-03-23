
// Define dimensions for each block
base_block_width = 50;
base_block_depth = 50;
base_block_height = 20;

intermediate_block_width = 40;
intermediate_block_depth = 40;
intermediate_block_height = 15;

top_block_width = 30;
top_block_depth = 30;
top_block_height = 10;

// Base block
module base_block() {
    cube([base_block_width, base_block_depth, base_block_height], center = true);
}

// Intermediate block
module intermediate_block() {
    cube([intermediate_block_width, intermediate_block_depth, intermediate_block_height], center = true);
}

// Top block
module top_block() {
    cube([top_block_width, top_block_depth, top_block_height], center = true);
}

// Assemble the model
module flexible_coupling() {
    // Layer 3: Base block
    translate([0, 0, -base_block_height / 2])
        base_block();

    // Layer 2: Intermediate block
    translate([0, 0, base_block_height / 2 + intermediate_block_height / 2])
        intermediate_block();

    // Layer 1: Top block
    translate([0, 0, base_block_height / 2 + intermediate_block_height + top_block_height / 2])
        top_block();
}

// Render the model
flexible_coupling();

