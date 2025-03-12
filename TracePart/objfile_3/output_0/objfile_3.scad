
$fn=100; // Smooth rendering

// Parameters
coupling_diameter = 20;
coupling_length = 30;
shaft_hole_diameter = 6;
screw_hole_diameter = 4;
screw_head_diameter = 8;
screw_head_depth = 3;
slit_width = 1.5;
slit_depth = 10;

// Main coupling body
difference() {
    cylinder(d=coupling_diameter, h=coupling_length, center=true);
    
    // Shaft holes
    translate([0, 0, -coupling_length/3])
        cylinder(d=shaft_hole_diameter, h=coupling_length, center=true);
    
    translate([0, 0, coupling_length/3])
        cylinder(d=shaft_hole_diameter, h=coupling_length, center=true);
    
    // Screw holes
    for (z = [-coupling_length/3, coupling_length/3]) {
        translate([coupling_diameter/2 - 2, 0, z])
            rotate([0, 90, 0])
            cylinder(d=screw_hole_diameter, h=coupling_diameter, center=true);
        
        // Screw head recess
        translate([coupling_diameter/2 - 2, 0, z])
            rotate([0, 90, 0])
            cylinder(d=screw_head_diameter, h=screw_head_depth, center=true);
    }
    
    // Slits for flexibility
    for (z = [-coupling_length/2 + slit_depth, coupling_length/2 - slit_depth]) {
        translate([0, 0, z])
            cube([coupling_diameter, slit_width, slit_depth], center=true);
    }
}

