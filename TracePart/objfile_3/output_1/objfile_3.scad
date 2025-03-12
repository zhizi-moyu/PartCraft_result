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
slot_length = 15;
slot_width = 3;
slot_depth = 5;
cutout_depth = 5;
cutout_width = 6;

// Main coupling body with modifications
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
    
    // Additional slots for flexibility
    for (angle = [0, 90]) {
        rotate([0, 0, angle])
            translate([coupling_diameter/2 - slot_depth, 0, 0])
                cube([slot_depth, slot_width, slot_length], center=true);
    }
    
    // Structural cutouts
    for (z = [-coupling_length/4, coupling_length/4]) {
        translate([0, 0, z])
            cube([cutout_width, coupling_diameter, cutout_depth], center=true);
    }
}

// Locking mechanism cutout
translate([0, 0, coupling_length/2 - cutout_depth])
    cube([coupling_diameter, cutout_width, cutout_depth], center=true);
