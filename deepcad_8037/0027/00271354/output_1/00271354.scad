
// Angular Connector Component
module angular_connector() {
    difference() {
        // Base block with adjusted dimensions for a less bulky profile
        cube([20, 10, 5], center = true);
        
        // Refined stepped profile
        translate([0, 0, 2.5])
            cube([12, 8, 5], center = true);
        
        // Additional tapering for angular design
        translate([0, 0, 2.5])
            rotate([0, 0, 45])
            cube([10, 10, 5], center = true);
    }
}

// Render the angular connector
angular_connector();

