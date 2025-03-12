
// Parameters
flexible_coupling_length = 50; // Total length of the coupling
flexible_coupling_diameter = 20; // Diameter of the coupling
central_section_diameter = 16; // Adjusted diameter of the central section to match the original model
slit_width = 1; // Width of the slits
slit_depth = 8; // Depth of the slits
hole_diameter = 6; // Diameter of the shaft holes
threaded_hole_diameter = 3; // Diameter of the threaded holes
screw_diameter = 3; // Diameter of the fastening screws
screw_length = 10; // Length of the fastening screws
hex_head_diameter = 5; // Diameter of the hexagonal socket head

// Flexible Coupling Body
module flexible_coupling_body() {
    difference() {
        // Main cylindrical body with a narrower central section
        union() {
            cylinder(flexible_coupling_length / 4, flexible_coupling_diameter / 2, flexible_coupling_diameter / 2);
            translate([0, 0, flexible_coupling_length / 4])
                cylinder(flexible_coupling_length / 2, central_section_diameter / 2, central_section_diameter / 2);
            translate([0, 0, flexible_coupling_length * 3 / 4])
                cylinder(flexible_coupling_length / 4, flexible_coupling_diameter / 2, flexible_coupling_diameter / 2);
        }
        
        // Shaft holes
        translate([0, 0, flexible_coupling_length / 2])
            cylinder(flexible_coupling_length, hole_diameter / 2, hole_diameter / 2);
        
        // Slits for flexibility
        for (i = [0 : 90 : 270]) {
            rotate([0, 0, i])
                for (j = [flexible_coupling_length / 6, flexible_coupling_length / 2, flexible_coupling_length * 5 / 6]) {
                    translate([flexible_coupling_diameter / 2, 0, j])
                        cube([slit_width, slit_depth, flexible_coupling_length / 3], center = true);
                }
        }
        
        // Threaded holes for screws
        for (i = [flexible_coupling_length / 4, flexible_coupling_length * 3 / 4]) {
            translate([flexible_coupling_diameter / 2, 0, i])
                rotate([90, 0, 0])
                    cylinder(flexible_coupling_length, threaded_hole_diameter / 2, threaded_hole_diameter / 2);
        }
    }
}

// Fastening Screw with Hexagonal Socket Head
module fastening_screw() {
    union() {
        cylinder(screw_length, screw_diameter / 2, screw_diameter / 2);
        translate([0, 0, screw_length])
            cylinder(screw_diameter / 2, screw_diameter / 2, screw_diameter / 2);
        
        // Hexagonal socket head
        translate([0, 0, screw_length - screw_diameter / 2])
            cylinder(screw_diameter / 2, hex_head_diameter / 2, hex_head_diameter / 2, $fn=6);
    }
}

// Assembly
module assembly() {
    // Flexible coupling body
    flexible_coupling_body();
    
    // Fastening screws properly inserted into the threaded holes
    for (i = [flexible_coupling_length / 4, flexible_coupling_length * 3 / 4]) {
        translate([flexible_coupling_diameter / 2 - screw_length / 2, 0, i])
            rotate([90, 0, 0])
                fastening_screw();
    }
}

// Render the assembly
assembly();

