
// Parameters for the cylindrical segment
cylinder_diameter = 20;
cylinder_height = 40;

// Parameters for the rectangular prism segment
rect_prism_width = 10;
rect_prism_depth = 10;
rect_prism_height = 20;

// Creating the cylindrical segment
module cylinder_segment() {
    cylinder(h = cylinder_height, d = cylinder_diameter, center = true);
}

// Creating the rectangular prism segment
module rectangular_prism_segment() {
    translate([0, 0, -rect_prism_height / 2])
        cube([rect_prism_width, rect_prism_depth, rect_prism_height], center = true);
}

// Assembling the components
module flexible_coupling() {
    // Layer 1: Place the cylindrical segment on top
    translate([0, 0, cylinder_height / 2])
        cylinder_segment();
    
    // Layer 2: Attach the rectangular prism segment below the cylinder
    translate([0, -rect_prism_depth / 2, -rect_prism_height / 2])
        rectangular_prism_segment();
}

// Render the model
flexible_coupling();

