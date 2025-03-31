// Dimensions
cylinder_diameter = 20;  // Adjusted diameter for the cylindrical body
cylinder_height = 30;    // Adjusted height for better elongation
rect_proj_length = 15;   // Length of the rectangular projection
rect_proj_height = 12;   // Height of the rectangular projection
rect_proj_width = 10;    // Depth/width of the rectangular projection

// Main cylindrical body
module cylindrical_body() {
    // $fn is set higher to ensure smoothness, interpreted as a matte finish
    cylinder(h = cylinder_height, d = cylinder_diameter, $fn = 150); 
}

// Rectangular projection
module rectangular_projection() {
    // Translate adjusted for more precise positioning
    translate([cylinder_diameter / 2, -rect_proj_width / 2, -rect_proj_height / 2]) 
    cube([rect_proj_length, rect_proj_width, rect_proj_height]);
}

// Combine components to form the coupling
module flexible_coupling() {
    cylindrical_body();
    translate([0, 0, cylinder_height / 2]) // Center the projection vertically
    rectangular_projection();
}

// Render the model
flexible_coupling();
