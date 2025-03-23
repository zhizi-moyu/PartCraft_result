// Parameters for the rectangular frame
frame_length = 100;  // Length of the outer rectangle
frame_width = 50;    // Width of the outer rectangle
frame_thickness = 5; // Thickness of the frame
division_count = 4;  // Number of internal divisions (modified to create 5 openings)
division_thickness = 5; // Thickness of the internal divisions

module rectangular_frame() {
    // Outer frame
    difference() {
        // Outer rectangle
        cube([frame_length, frame_width, frame_thickness], center = true);
        
        // Hollow inner rectangle
        translate([0, 0, -0.1]) // Slightly offset to ensure proper subtraction
        cube([frame_length - 2 * frame_thickness, frame_width - 2 * frame_thickness, frame_thickness + 0.2], center = true);
    }
    
    // Internal divisions
    for (i = [1:division_count]) {
        translate([-(frame_length / 2) + (i * (frame_length / (division_count + 1))), 0, 0])
        cube([division_thickness, frame_width, frame_thickness], center = true);
    }
}

// Render the rectangular frame
rectangular_frame();
