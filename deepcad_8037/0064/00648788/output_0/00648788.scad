
// Parameters
hollow_body_length = 30; // Length of the hollow body
hollow_body_width = 20;  // Width of the hollow body
hollow_body_height = 40; // Height of the hollow body
center_hole_diameter = 15; // Diameter of the central hollow cylindrical hole
side_hole_diameter = 5;    // Diameter of the smaller side hole
side_hole_offset = 10;     // Offset of the side hole from the center

// Main module
module hollow_body_with_side_hole() {
    // Create the main body
    difference() {
        // Outer shape
        translate([0, 0, 0])
        rotate([0, 0, 0])
        cube([hollow_body_width,hollow_body_height,hollow_body_width])
    }
}

// Render the component
hollow_body_with_side_hole();

