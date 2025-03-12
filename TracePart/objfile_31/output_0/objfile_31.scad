
// Parameters
coupling_diameter = 20;
coupling_height = 30;
shaft_hole_diameter = 6;
set_screw_hole_diameter = 3;
set_screw_hole_depth = 5;
slit_width = 1;
slit_spacing = 3;
num_slits = 5;

// Function to create the flexible coupling body
module flexible_coupling_body() {
    difference() {
        // Main cylindrical body
        cylinder(h = coupling_height, d = coupling_diameter, center = true);
        
        // Central bore for shaft insertion
        cylinder(h = coupling_height + 2, d = shaft_hole_diameter, center = true);
        
        // Set screw holes
        for (i = [0:3]) {
            rotate([0, 0, i * 90])
                translate([coupling_diameter / 2 - 2, 0, coupling_height / 4])
                    rotate([0, 90, 0])
                        cylinder(h = set_screw_hole_depth, d = set_screw_hole_diameter, center = true);
        }
        
        for (i = [0:3]) {
            rotate([0, 0, i * 90])
                translate([coupling_diameter / 2 - 2, 0, -coupling_height / 4])
                    rotate([0, 90, 0])
                        cylinder(h = set_screw_hole_depth, d = set_screw_hole_diameter, center = true);
        }
        
        // Slits for flexibility
        for (i = [0:num_slits - 1]) {
            translate([0, 0, -coupling_height / 2 + (i + 0.5) * slit_spacing])
                cube([coupling_diameter, slit_width, coupling_height / 2], center = true);
        }
    }
}

// Function to create set screws
module set_screw() {
    cylinder(h = 4, d = set_screw_hole_diameter + 1, center = true);
}

// Assemble the model
module flexible_coupling() {
    flexible_coupling_body();
    
    // Positioning the set screws
    for (i = [0:3]) {
        rotate([0, 0, i * 90])
            translate([coupling_diameter / 2 - 2, 0, coupling_height / 4])
                set_screw();
    }
    
    for (i = [0:3]) {
        rotate([0, 0, i * 90])
            translate([coupling_diameter / 2 - 2, 0, -coupling_height / 4])
                set_screw();
    }
}

// Render the final model
flexible_coupling();

