
// Parameters for the rectangular hollow bar
length = 100; // Length of the bar
width = 20;   // Outer width of the bar
height = 10;  // Outer height of the bar
wall_thickness = 2; // Thickness of the walls

// Function to create a rectangular hollow bar
module rectangular_hollow_bar() {
    difference() {
        // Outer rectangular prism
        cube([length, width, height], center = true);
        // Inner hollow space
        translate([0, 0, 0]) {
            cube([length - 2 * wall_thickness, width - 2 * wall_thickness, height - 2 * wall_thickness], center = true);
        }
    }
}

// Generate the rectangular hollow bar
rectangular_hollow_bar();

