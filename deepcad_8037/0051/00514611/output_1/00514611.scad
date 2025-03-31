// Parameters for dimensions
cylinder_diameter = 20;
cylinder_height = 40;
rectangular_length = 40;
rectangular_width = 10;
rectangular_height = 10;

// Function to create the cylindrical mount
module cylindrical_mount() {
    cylinder(d = cylinder_diameter, h = cylinder_height, center = true);
}

// Function to create the rectangular tang
module rectangular_tang() {
    translate([0, 0, cylinder_height / 2])
    rotate([90, 0, 0])  // Adjust the orientation to be perpendicular 
    translate([-rectangular_width / 2, -rectangular_length / 2, 0])
    cube([rectangular_width, rectangular_length, rectangular_height], center = false);
}

// Assembly of components
module flexible_coupling() {
    // Base layer - cylindrical_mount
    cylindrical_mount();
    // Protruding layer - rectangular_tang
    rectangular_tang();
}

// Render the model
flexible_coupling();
