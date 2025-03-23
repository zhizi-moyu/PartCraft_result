
// Parameters for the rectangular hollow component
length = 200; // Increased length to match the original model
width = 20;   // Outer width of the prism
height = 20;  // Outer height of the prism
thickness = 2; // Wall thickness of the hollow prism
hole_diameter = 8; // Diameter of the circular holes
hole_spacing = 80; // Adjusted spacing between the holes to match the original model

module rectangular_hollow_component() {
    // Outer rectangular prism
    difference() {
        cube([length, width, height], center = true);
        
        // Inner hollow space
        translate([0, 0, 0])
            cube([length - 2 * thickness, width - 2 * thickness, height - 2 * thickness], center = true);
        
        // Circular holes on one face
        for (i = [-1, 0, 1]) { // Adjusted to create evenly spaced holes along the length
            translate([i * hole_spacing, width / 2, 0])
                rotate([90, 0, 0])
                    cylinder(r = hole_diameter / 2, h = width + 1, center = true);
        }
        
        // Circular holes on the opposite face
        for (i = [-1, 0, 1]) { // Adjusted to create evenly spaced holes along the length
            translate([i * hole_spacing, -width / 2, 0])
                rotate([90, 0, 0])
                    cylinder(r = hole_diameter / 2, h = width + 1, center = true);
        }
    }
}

// Render the rectangular hollow component
rectangular_hollow_component();

