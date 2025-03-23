
// Parameters for the rectangular bar
length = 80; // Length of the bar
width = 12;  // Adjusted width to reduce thickness
height = 6;  // Adjusted height to reduce thickness
corner_radius = 4; // Adjusted radius for more streamlined curvature
hole_radius = 3; // Radius of the through-holes remains the same
hole_offset = 6; // Adjusted offset to align the through-holes correctly

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
            cylinder(r=hole_radius, h=length + 2); // Slightly extended length for better alignment
        translate([length - hole_offset, width / 2, height / 2])
            rotate([90, 0, 0])
            cylinder(r=hole_radius, h=length + 2); // Slightly extended length for better alignment
    }
}

// Render the rectangular bar
rectangular_bar();

