
// Parameters for the central body
module central_body() {
    difference() {
        // Main cylindrical body
        cylinder(h = 10, r = 15, center = true);
        
        // Central hole
        translate([0, 0, -5])
            cylinder(h = 20, r = 5, center = true);
        
        // Rectangular cutouts on opposite sides
        translate([-7.5, -2.5, -5])
            cube([15, 5, 10], center = true);
        translate([7.5, -2.5, -5])
            cube([15, 5, 10], center = true);
    }
}

// Parameters for the side arm
module side_arm() {
    union() {
        // L-shaped arm
        cube([15, 5, 10], center = true);
        translate([7.5, 0, 0])
            cube([15, 5, 5], center = true);
    }
}

// Assembly of the flexible coupling
module flexible_coupling() {
    // Layer 1: Central body
    central_body();
    
    // Layer 2: Side arms
    translate([-15, 0, 0])
        side_arm();
    translate([15, 0, 0])
        side_arm();
}

// Render the model
flexible_coupling();

