
// Define dimensions for the rectangular bar
module rectangular_bar(length, width, thickness) {
    cube([length, width, thickness], center=true);
}

// Parameters for the rectangular bars
length = 50;  // Length of the bar
width = 10;   // Width of the bar
thickness = 5; // Thickness of the bar
spacing = 60; // Spacing between bars (adjusted for uniformity)

// Generate the six rectangular bars in a uniform arrangement
translate([0, 0, 0]) rectangular_bar(length, width, thickness);
translate([spacing, 0, 0]) rectangular_bar(length, width, thickness);
translate([-spacing, 0, 0]) rectangular_bar(length, width, thickness);
translate([0, spacing, 0]) rectangular_bar(length, width, thickness);
translate([0, -spacing, 0]) rectangular_bar(length, width, thickness);
translate([spacing, spacing, 0]) rectangular_bar(length, width, thickness);

