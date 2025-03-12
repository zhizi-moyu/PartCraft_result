
// Main body of the coupling
module main_body() {
    difference() {
        cube([30, 30, 20], center = true);
        
        // Cylindrical recess for pivot pins
        translate([0, 0, 0])
            cylinder(h = 30, d = 10, center = true);
        
        // Mounting holes
        translate([-10, -10, 0])
            cylinder(h = 30, d = 4, center = true);
        translate([10, -10, 0])
            cylinder(h = 30, d = 4, center = true);
        
        // Curved slots
        translate([0, 0, 5])
            rotate([0, 90, 0])
            cylinder(h = 30, d = 8, center = true);
    }
}

// Clamping jaw
module clamping_jaw() {
    difference() {
        cube([10, 30, 10], center = true);
        
        // Cylindrical cutout for gripping
        translate([0, 0, 0])
            rotate([0, 90, 0])
            cylinder(h = 30, d = 8, center = true);
    }
}

// Pivot pin
module pivot_pin() {
    cylinder(h = 12, d = 6, center = true);
}

// Fastening bolt
module fastening_bolt() {
    union() {
        cylinder(h = 15, d = 4, center = true);
        translate([0, 0, 7])
            cylinder(h = 3, d = 6, center = true);
    }
}

// Locking screw
module locking_screw() {
    cylinder(h = 10, d = 3, center = true);
}

// Assembly
module assembly() {
    main_body();
    
    // Clamping jaws
    translate([0, 10, 5])
        clamping_jaw();
    translate([0, -10, 5])
        clamping_jaw();
    
    // Pivot pins
    translate([0, 0, 5])
        pivot_pin();
    translate([0, 0, -5])
        pivot_pin();
    
    // Fastening bolts
    translate([-10, -10, 5])
        fastening_bolt();
    translate([10, -10, 5])
        fastening_bolt();
    
    // Locking screws
    translate([-10, 10, 5])
        locking_screw();
    translate([10, 10, 5])
        locking_screw();
}

// Render the assembly
assembly();

