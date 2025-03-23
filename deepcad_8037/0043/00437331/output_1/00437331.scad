
// Parameters for the rectangular bar
bar_length = 50;  // Length of the rectangular bar
bar_width = 10;   // Width of the rectangular bar
bar_height = 5;   // Height of the rectangular bar
bar_spacing = 60; // Spacing between bars

// Function to create a single rectangular bar
module rectangular_bar() {
    cube([bar_length, bar_width, bar_height], center = true);
}

// Main assembly
module assembly() {
    for (i = [0:5]) {
        translate([i * bar_spacing, 0, 0])  // Position the bars horizontally, spaced apart
        rectangular_bar();
    }
}

// Call the assembly module to render the model
assembly();

