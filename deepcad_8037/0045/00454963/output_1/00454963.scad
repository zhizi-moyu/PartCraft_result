// Parameters for the bolt
bolt_length = 50; // Length of the bolt
bolt_diameter = 5; // Diameter of the bolt
head_diameter = 7; // Adjusted diameter of the flat head to match the original model
head_thickness = 2; // Thickness of the flat head
thread_length = 35; // Adjusted length of the threaded section to match the original model
thread_width = 0.5; // Reduced prominence of the threading pattern
thread_spacing = 3; // Increased spacing between threads for a less pronounced pattern

module bolt() {
    // Bolt body
    cylinder(h = bolt_length - head_thickness, d = bolt_diameter, center = false);
    
    // Flat head
    translate([0, 0, bolt_length - head_thickness])
        cylinder(h = head_thickness, d = head_diameter, center = false);
    
    // Threading (visual representation)
    translate([0, 0, 0])
        for (i = [0:thread_spacing:thread_length]) {
            rotate([0, 0, i * 10])
                translate([bolt_diameter / 2, 0, i])
                    cube([thread_width, thread_width, 2], center = true);
        }
}

// Render the bolt
bolt();
