
// Define dimensions for the rectangular blocks
block_width = 20;  // Width of the block
block_height = 10; // Height of the block
block_depth = 40;  // Depth of the block

// Function to create a rectangular block
module rectangular_block() {
    cube([block_width, block_depth, block_height], center = true);
}

// Position rectangular_block_1 as a standalone block
translate([0, 0, 0])
    rectangular_block();

// Position rectangular_block_2 as a standalone block
translate([50, 0, 0])
    rectangular_block();

// Position rectangular_block_3 as a standalone block
translate([-50, 0, 0])
    rectangular_block();

// Position rectangular_block_4 as a standalone block
translate([0, 50, 0])
    rectangular_block();

// Position rectangular_block_5 as a standalone block
translate([0, -50, 0])
    rectangular_block();

// Position rectangular_block_6 as a standalone block
translate([0, 0, 50])
    rectangular_block();

