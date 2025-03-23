
// Parameters for the rectangular bar
bar_length = 50; // Length of the bar
bar_width = 10;  // Width of the bar
bar_thickness = 5; // Thickness of the bar
bevel_length = 5; // Length of the beveled end

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
        rotate([0, 0, i * 60]) // Rotate each bar evenly around the center
            translate([20, 0, 0]) // Offset from the center
            rectangular_bar();
    }
}

// Generate the model
layer_1();

