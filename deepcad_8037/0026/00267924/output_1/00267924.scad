// Parameters for the flat bar with a hole
bar_length = 60;       // Length of the bar
bar_width = 15;        // Width of the bar
bar_thickness = 3;     // Thickness of the bar
hole_diameter = 5;     // Diameter of the hole
hole_offset = 7.5;     // Distance from the center of the hole to the end of the bar

// Main module to create the flat bar with a hole
module flat_bar_with_hole() {
    // Create the rectangular bar
    difference() {
        cube([bar_length, bar_width, bar_thickness], center = false);
        
        // Subtract the hole
        translate([hole_offset, bar_width / 2, bar_thickness / 2])
            rotate([90, 0, 0])
            cylinder(r = hole_diameter / 2, h = bar_thickness + 1, center = true);
    }
}

// Render the flat bar with a hole
flat_bar_with_hole();
