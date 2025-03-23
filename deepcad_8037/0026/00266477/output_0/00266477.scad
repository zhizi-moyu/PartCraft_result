
// Define the dimensions of the rectangular block
length = 60;  // Length of the block
width = 30;   // Width of the block
height = 20;  // Height of the block

// Create the rectangular block
module rectangular_block() {
    color("white") {
        cube([length, width, height], center = true);
    }
}

// Call the module to render the block
rectangular_block();

