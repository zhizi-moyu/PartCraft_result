
// Parameters for dimensions
central_block_width = 20;
central_block_height = 10;
central_block_depth = 10;
v_notch_depth = 7; // Increased depth for a more pronounced V-shaped notch
v_notch_width = 10;

side_block_width = 20;
side_block_height = 8;
side_block_depth = 10;
side_v_notch_depth = 6; // Increased depth for side block V-shaped notch
side_v_notch_width = 10;

spacer_block_width = 20;
spacer_block_height = 1.5; // Reduced thickness for spacer block
spacer_block_depth = 10;

// Function to create a block with a V-shaped notch
module v_notched_block(width, height, depth, notch_width, notch_depth) {
    difference() {
        cube([width, depth, height], center = true);
        translate([-notch_width / 2, -depth / 2, -height / 2])
            polyhedron(
                points = [
                    [0, 0, 0],
                    [notch_width, 0, 0],
                    [notch_width / 2, 0, notch_depth]
                ],
                faces = [[0, 1, 2]]
            );
    }
}

// Central block
module central_block() {
    v_notched_block(
        central_block_width,
        central_block_height,
        central_block_depth,
        v_notch_width,
        v_notch_depth
    );
}

// Side block
module side_block() {
    v_notched_block(
        side_block_width,
        side_block_height,
        side_block_depth,
        side_v_notch_width,
        side_v_notch_depth
    );
}

// Spacer block
module spacer_block() {
    cube([spacer_block_width, spacer_block_depth, spacer_block_height], center = true);
}

// Assembly
module flexible_coupling() {
    translate([0, 0, side_block_height / 2 + spacer_block_height + central_block_height / 2])
        side_block();
    translate([0, 0, central_block_height / 2])
        spacer_block();
    translate([0, 0, 0])
        central_block();
    translate([0, 0, -central_block_height / 2 - spacer_block_height])
        spacer_block();
    translate([0, 0, -central_block_height / 2 - spacer_block_height - side_block_height / 2])
        rotate([0, 0, 180])
        side_block();
}

// Render the model
flexible_coupling();

