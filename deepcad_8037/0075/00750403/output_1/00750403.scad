
// Parameters for the model
outer_frame_length = 60;  // Length of the outer frame
outer_frame_width = 30;   // Width of the outer frame
outer_frame_height = 40;  // Height of the outer frame
outer_frame_thickness = 3; // Thickness of the outer frame walls

inner_divider_thickness = 3; // Thickness of the inner dividers
inner_divider_spacing = outer_frame_height / 2; // Spacing between dividers (adjusted to split into two equal sections)

side_wall_thickness = 2; // Adjusted thickness of the side walls

// Module for the outer frame
module outer_frame() {
    difference() {
        // Outer block
        cube([outer_frame_length, outer_frame_width, outer_frame_height], center = true);
        // Hollowed-out inner block with larger front and back openings
        translate([0, 0, 0])
            cube([outer_frame_length - 2 * outer_frame_thickness, 
                  outer_frame_width - 2 * outer_frame_thickness, 
                  outer_frame_height], center = true);
        // Front opening
        translate([-outer_frame_length / 2, -outer_frame_width / 2, 0])
            cube([outer_frame_length / 2, outer_frame_width, outer_frame_height], center = false);
        // Back opening
        translate([outer_frame_length / 2, -outer_frame_width / 2, 0])
            cube([outer_frame_length / 2, outer_frame_width, outer_frame_height], center = false);
    }
}

// Module for an inner divider
module inner_divider(position_z) {
    translate([0, 0, position_z])
        cube([outer_frame_length - 2 * outer_frame_thickness, 
              outer_frame_width - 2 * outer_frame_thickness, 
              inner_divider_thickness], center = true);
}

// Module for a side wall
module side_wall(position_x) {
    translate([position_x, 0, 0])
        cube([side_wall_thickness, 
              outer_frame_width, 
              outer_frame_height], center = true);
}

// Assemble the model
module flexible_coupling() {
    // Layer 1: Outer frame
    outer_frame();
    
    // Layer 2: Inner dividers (adjusted to split into two equal sections)
    inner_divider(-inner_divider_spacing / 2);
    inner_divider(inner_divider_spacing / 2);
    
    // Layer 3: Side walls (adjusted thickness and alignment)
    side_wall(-outer_frame_length / 2 + side_wall_thickness / 2);
    side_wall(outer_frame_length / 2 - side_wall_thickness / 2);
}

// Render the model
flexible_coupling();

