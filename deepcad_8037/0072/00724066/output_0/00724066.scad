
// Parameters for the components
central_block_length = 60;
central_block_width = 30;
central_block_height = 20;
groove_depth = 5;
groove_width = 20;

spacer_block_length = 60;
spacer_block_width = 30;
spacer_block_height = 10;

// Function to create the central block
module central_block() {
    difference() {
        // Main block
        cube([central_block_length, central_block_width, central_block_height], center = true);
        // Groove
        translate([0, 0, -groove_depth / 2])
            cube([central_block_length, groove_width, groove_depth], center = true);
    }
}

// Function to create a spacer block
module spacer_block() {
    difference() {
        // Main block
        cube([spacer_block_length, spacer_block_width, spacer_block_height], center = true);
        // Groove to fit into the central block
        translate([0, 0, spacer_block_height / 2 - groove_depth])
            cube([spacer_block_length, groove_width, groove_depth], center = true);
    }
}

// Assembly of the flexible coupling
module flexible_coupling() {
    // Layer 1: Top spacer block
    translate([0, 0, central_block_height / 2 + spacer_block_height / 2])
        spacer_block();
    // Layer 2: Central block
    central_block();
    // Layer 3: Bottom spacer block
    translate([0, 0, -(central_block_height / 2 + spacer_block_height / 2)])
        spacer_block();
}

// Render the model
flexible_coupling();

