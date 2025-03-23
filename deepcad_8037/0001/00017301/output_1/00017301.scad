
// Dimensions
base_length = 65;  // Increased length of the base block to match the original model
base_width = 30;   // Width of the base block remains the same
base_height = 15;  // Height of the base block remains the same

side_wall_thickness = 4;  // Reduced thickness of the side walls to match the original model
side_wall_height = 12;    // Increased height of the side walls to match the original model

slot_width = base_width - 2 * side_wall_thickness;  // Adjusted width of the central slot
slot_depth = 12;  // Increased depth of the central slot to match the original model

// Base block with sharper edges
module base_block() {
    cube([base_length, base_width, base_height]);
}

// Side walls with sharper top edges
module side_wall() {
    cube([base_length, side_wall_thickness, side_wall_height]);
}

// Central slot with a flatter bottom profile
module central_slot() {
    translate([0, side_wall_thickness, 0])
        cube([base_length, slot_width, slot_depth]);
}

// Assembling the model
module flexible_coupling() {
    // Base block
    base_block();

    // Side walls
    translate([0, 0, base_height])
        side_wall();
    translate([0, base_width - side_wall_thickness, base_height])
        side_wall();

    // Central slot
    translate([0, 0, base_height - slot_depth])
        central_slot();
}

// Render the model
flexible_coupling();

