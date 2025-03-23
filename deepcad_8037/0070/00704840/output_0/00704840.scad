
// Define dimensions for the rectangular block
length = 50;  // Length of the block
width = 30;   // Width of the block
thickness = 5; // Thickness of the block

// Create the rectangular block
module rectangular_block() {
    cube([length, width, thickness], center = true);
}

// Render the model
rectangular_block();

