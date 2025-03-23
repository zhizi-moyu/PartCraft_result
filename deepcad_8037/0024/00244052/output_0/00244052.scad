
// Base block dimensions
base_block_length = 50;  // Length of the base block
base_block_width = 50;   // Width of the base block
base_block_height = 10;  // Height of the base block

// Vertical block dimensions
vertical_block_length = 10;  // Length of the vertical block
vertical_block_width = 50;   // Width of the vertical block
vertical_block_height = 40;  // Height of the vertical block

// Horizontal block dimensions
horizontal_block_length = 50;  // Length of the horizontal block
horizontal_block_width = 10;   // Width of the horizontal block
horizontal_block_height = 10;  // Height of the horizontal block

// Base block
module base_block() {
    cube([base_block_length, base_block_width, base_block_height]);
}

// Vertical block
module vertical_block() {
    translate([(base_block_length - vertical_block_length) / 2, 0, base_block_height])
        cube([vertical_block_length, vertical_block_width, vertical_block_height]);
}

// Horizontal block
module horizontal_block() {
    translate([0, (base_block_width - horizontal_block_width) / 2, base_block_height + vertical_block_height])
        cube([horizontal_block_length, horizontal_block_width, horizontal_block_height]);
}

// Assemble the model
module flexible_coupling() {
    base_block();
    vertical_block();
    horizontal_block();
}

// Render the model
flexible_coupling();

