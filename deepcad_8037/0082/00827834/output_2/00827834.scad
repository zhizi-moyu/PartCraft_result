
// Dimensions
outer_frame_width = 100;
outer_frame_height = 150;
outer_frame_depth = 50;
outer_frame_thickness = 5;

shelf_thickness = 5;
shelf_spacing = 30;

vertical_divider_thickness = 5;

angled_support_thickness = 5;
angled_support_angle = 45; // degrees

// Outer Frame
module outer_frame() {
    difference() {
        // Simplified rectangular hollow structure
        cube([outer_frame_width, outer_frame_depth, outer_frame_height]);
        translate([outer_frame_thickness, outer_frame_thickness, outer_frame_thickness])
            cube([outer_frame_width - 2 * outer_frame_thickness, 
                  outer_frame_depth - 2 * outer_frame_thickness, 
                  outer_frame_height - 2 * outer_frame_thickness]);
    }
}

// Horizontal Shelf
module horizontal_shelf(y_position) {
    translate([outer_frame_thickness, y_position, outer_frame_thickness])
        cube([outer_frame_width - 2 * outer_frame_thickness, shelf_thickness, outer_frame_depth - 2 * outer_frame_thickness]);
}

// Vertical Divider
module vertical_divider() {
    translate([(outer_frame_width - vertical_divider_thickness) / 2, outer_frame_thickness, outer_frame_thickness])
        cube([vertical_divider_thickness, outer_frame_depth - 2 * outer_frame_thickness, outer_frame_height - 2 * outer_frame_thickness]);
}

// Angled Support Panel
module angled_support_panel() {
    translate([(outer_frame_width - vertical_divider_thickness) / 2, outer_frame_thickness, outer_frame_height / 2])
        rotate([0, 0, -angled_support_angle])
            cube([outer_frame_width / 2 - outer_frame_thickness, angled_support_thickness, outer_frame_depth - 2 * outer_frame_thickness]);
}

// Assemble the model
module model() {
    // Layer 1: Outer Frame
    outer_frame();

    // Layer 2-5: Horizontal Shelves (4 evenly spaced shelves)
    for (i = [0:3]) {
        horizontal_shelf(outer_frame_thickness + i * (shelf_spacing + shelf_thickness));
    }

    // Layer 6: Vertical Divider
    vertical_divider();

    // Layer 7: Angled Support Panel
    angled_support_panel();
}

// Render the model
model();

