
// Base block dimensions
base_length = 50;  // Length of the base block
base_width = 30;   // Width of the base block
base_height = 20;  // Height of the base block

// Slanted block dimensions
slanted_length = 30;  // Length of the slanted block
slanted_width = 30;   // Width of the slanted block
slanted_height = 20;  // Height of the slanted block
slant_angle = 45;     // Angle of the slanted face

// Base block
module base_block() {
    cube([base_length, base_width, base_height]);
}

// Slanted block
module slanted_block() {
    difference() {
        cube([slanted_length, slanted_width, slanted_height]);
        translate([0, 0, 0]) {
            rotate([0, slant_angle, 0]) {
                translate([0, -slanted_width, 0]) {
                    cube([slanted_length, slanted_width * 2, slanted_height]);
                }
            }
        }
    }
}

// Assemble the model
module flexible_coupling() {
    // Base block
    base_block();

    // Slanted block positioned on top of the base block
    translate([base_length - slanted_length, 0, base_height]) {
        slanted_block();
    }
}

// Render the model
flexible_coupling();

