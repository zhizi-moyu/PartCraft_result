// Angular Connector Component
module angular_connector() {
    difference() {
        // Base block with adjusted dimensions for a sharper profile
        cube([20, 10, 5], center = true);
        
        // Sharper stepped profile
        translate([0, 0, 2.5])
            cube([14, 8, 5], center = true);
        
        // More defined angular tapering
        translate([0, 0, 5])
            rotate([0, 0, 45])
            cube([12, 12, 5], center = true);
    }
}

// Render the angular connector
angular_connector();
