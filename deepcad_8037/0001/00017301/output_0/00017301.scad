
// Dimensions
base_length = 60;  // Length of the base block
base_width = 30;   // Width of the base block
base_height = 15;  // Height of the base block

side_wall_thickness = 5;  // Thickness of the side walls
side_wall_height = 10;    // Height of the side walls

slot_width = base_width - 2 * side_wall_thickness;  // Width of the central slot
slot_depth = 10;  // Depth of the central slot

// Base block
module base_block() {
    cube([base_length, base_width, base_height]);
}

// Side walls
module side_wall() {
    cube([base_length, side_wall_thickness, side_wall_height]);
}

// Central slot
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

