
// Parameters for the central body
module central_body() {
    difference() {
        // Main cylindrical body
        cylinder(h = 10, r = 15, center = true);
        
        // Central hole
        translate([0, 0, -5])
            cylinder(h = 20, r = 7, center = true);
        
        // Rectangular cutouts on opposite sides
        translate([-7.5, -2.5, -5])
            cube([15, 5, 10], center = true);
        translate([7.5, -2.5, -5])
            cube([15, 5, 10], center = true);
        
        // Flat protruding surfaces with rectangular cutouts
        translate([-15, -2.5, -5])
            difference() {
                cube([5, 5, 10], center = true);
                translate([-2.5, 0, -2.5])
                    cube([2.5, 5, 5], center = true); // Rectangular cutout
            }
        translate([15, -2.5, -5])
            difference() {
                cube([5, 5, 10], center = true);
                translate([2.5, 0, -2.5])
                    cube([2.5, 5, 5], center = true); // Rectangular cutout
            }
    }
}

// Parameters for the side arm
module side_arm() {
    union() {
        // L-shaped arm
        cube([15, 5, 10], center = true);
        translate([7.5, 0, -2.5])
            cube([5, 5, 5], center = true); // L-shaped profile
    }
}

// Assembly of the flexible coupling
module flexible_coupling() {
    // Layer 1: Central body
    central_body();
    
    // Layer 2: Side arms (repositioned to align symmetrically and fit into the rectangular cutouts)
    translate([-15, 0, 0])
        rotate([0, 0, 90])
        side_arm();
    translate([15, 0, 0])
        rotate([0, 0, -90])
        side_arm();
}

// Render the model
flexible_coupling();

