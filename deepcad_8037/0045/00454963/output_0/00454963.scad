
// Parameters for the bolt
bolt_length = 50; // Length of the bolt
bolt_diameter = 5; // Diameter of the bolt
head_diameter = 8; // Diameter of the flat head
head_thickness = 2; // Thickness of the flat head
thread_length = 40; // Length of the threaded section

module bolt() {
    // Bolt body
    cylinder(h = bolt_length - head_thickness, d = bolt_diameter, center = false);
    
    // Flat head
    translate([0, 0, bolt_length - head_thickness])
        cylinder(h = head_thickness, d = head_diameter, center = false);
    
    // Threading (visual representation)
    translate([0, 0, 0])
        for (i = [0:2:thread_length]) {
            rotate([0, 0, i * 10])
                translate([bolt_diameter / 2, 0, i])
                    cube([1, 1, 2], center = true);
        }
}

// Render the bolt
bolt();

