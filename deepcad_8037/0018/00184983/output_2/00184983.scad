
// Parameters for the rectangular bar
bar_length = 60; // Increased length of the bar to match the original model
bar_width = 10;  // Width of the bar remains the same
bar_thickness = 4; // Reduced thickness of the bar for a more delicate appearance
bevel_length = 10; // Increased length of the beveled end for sharper tapering
spacing_offset = 20; // Reduced spacing between bars for a more compact arrangement
rotation_offset = 60; // Adjusted rotation angle to bring bars closer together

// Function to create a single rectangular bar with a beveled end
module rectangular_bar() {
    difference() {
        // Main rectangular prism
        cube([bar_length, bar_width, bar_thickness]);
        // Beveled end
        translate([bar_length - bevel_length, 0, 0])
            rotate([0, 45, 0])
            cube([bevel_length * sqrt(2), bar_width, bar_thickness]);
    }
}

// Positioning the six rectangular bars in the same vertical layer
module layer_1() {
    for (i = [0:5]) {
        rotate([0, 0, i * rotation_offset]) // Adjusted rotation angle for correct orientation
            translate([spacing_offset, 0, 0]) // Reduced spacing between bars
            rectangular_bar();
    }
}

// Generate the model
layer_1();

