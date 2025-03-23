// Parameters for the rectangular hollow bar
length = 100; // Length of the bar
outer_width = 20; // Outer width of the rectangle
outer_height = 10; // Outer height of the rectangle
wall_thickness = 2; // Thickness of the walls

// Adjusted parameters for alignment and cross-sectional shape
inner_width = outer_width - 2 * wall_thickness; // Inner width of the hollow section
inner_height = outer_height - 2 * wall_thickness; // Inner height of the hollow section
alignment_offset = [0, 0, 0]; // Adjusted position for alignment

// Function to create a rectangular hollow bar
module rectangular_hollow_bar() {
    difference() {
        // Outer rectangular prism
        cube([outer_width, outer_height, length], center = true);
        // Inner hollow rectangular prism
        translate([wall_thickness, wall_thickness, 0] + alignment_offset)
            cube([inner_width, inner_height, length], center = true);
    }
}

// Generate the rectangular hollow bar
rectangular_hollow_bar();
