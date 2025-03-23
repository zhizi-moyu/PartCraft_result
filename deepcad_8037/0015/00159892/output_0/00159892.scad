
// Parameters for the rectangular frame
frame_outer_width = 50;  // Outer width of the frame
frame_outer_height = 30; // Outer height of the frame
frame_thickness = 2;     // Thickness of the frame
frame_inner_width = frame_outer_width - 2 * frame_thickness; // Inner width of the hollow center
frame_inner_height = frame_outer_height - 2 * frame_thickness; // Inner height of the hollow center
frame_spacing = 5;       // Spacing between each frame layer
num_frames = 6;          // Total number of frames

// Function to create a single rectangular frame
module rectangular_frame() {
    difference() {
        // Outer rectangle
        cube([frame_outer_width, frame_outer_height, frame_thickness], center = true);
        // Inner hollow rectangle
        translate([0, 0, -0.1]) // Slightly offset to avoid rendering issues
        cube([frame_inner_width, frame_inner_height, frame_thickness + 0.2], center = true);
    }
}

// Assemble the layers of rectangular frames
module flexible_coupling() {
    for (i = [0 : num_frames - 1]) {
        translate([0, 0, -i * frame_spacing])
            rectangular_frame();
    }
}

// Render the flexible coupling
flexible_coupling();

