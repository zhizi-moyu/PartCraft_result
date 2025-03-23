
// Angular Connector Component
module angular_connector() {
    difference() {
        // Base block
        cube([20, 10, 5], center = true);
        
        // Step cut
        translate([0, 0, 2.5])
            cube([10, 10, 5], center = true);
    }
}

// Render the angular connector
angular_connector();

