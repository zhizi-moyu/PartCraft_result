
// Parameters for the rectangular bar
length = 60; // Length of the bar
width = 20;  // Width of the bar
height = 10; // Height of the bar
corner_radius = 5; // Radius for rounded edges
hole_radius = 3; // Radius of the through-holes
hole_offset = 10; // Distance from the ends to the center of the holes

// Main module
module rectangular_bar() {
    // Create the rounded rectangular bar
    difference() {
        // Rounded rectangular bar
        hull() {
            translate([corner_radius, corner_radius, 0])
                cylinder(r=corner_radius, h=height);
            translate([length - corner_radius, corner_radius, 0])
                cylinder(r=corner_radius, h=height);
            translate([corner_radius, width - corner_radius, 0])
                cylinder(r=corner_radius, h=height);
            translate([length - corner_radius, width - corner_radius, 0])
                cylinder(r=corner_radius, h=height);
        }
        
        // Through-holes
        translate([hole_offset, width / 2, height / 2])
            rotate([90, 0, 0])
            cylinder(r=hole_radius, h=length);
        translate([length - hole_offset, width / 2, height / 2])
            rotate([90, 0, 0])
            cylinder(r=hole_radius, h=length);
    }
}

// Render the rectangular bar
rectangular_bar();

