
// Dimensions for the components
central_block_size = [20, 20, 40]; // Central block dimensions
spacer_block_size = [18, 18, 10];  // Spacer block dimensions
connector_block_size = [18, 18, 10]; // Connector block dimensions

// Function to create a central block
module central_block() {
    cube(central_block_size, center = true);
}

// Function to create a spacer block
module spacer_block() {
    cube(spacer_block_size, center = true);
}

// Function to create a connector block
module connector_block() {
    cube(connector_block_size, center = true);
}

// Assembly of the model
module assembly() {
    // Layer 1: Top connector block
    translate([0, 0, central_block_size[2] / 2 + spacer_block_size[2] + connector_block_size[2] / 2])
        connector_block();

    // Layer 2: Top spacer block
    translate([0, 0, central_block_size[2] / 2 + spacer_block_size[2] / 2])
        spacer_block();

    // Layer 3: Central block
    translate([0, 0, 0])
        central_block();

    // Layer 4: Bottom spacer block
    translate([0, 0, -(central_block_size[2] / 2 + spacer_block_size[2] / 2)])
        spacer_block();

    // Layer 5: Bottom connector block
    translate([0, 0, -(central_block_size[2] / 2 + spacer_block_size[2] + connector_block_size[2] / 2)])
        connector_block();
}

// Render the assembly
assembly();

