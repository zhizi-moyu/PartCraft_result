module component_name_1() {
    // Adjusted dimensions of the rectangular prism to match the original model
    length = 50;  // Length of the prism remains the same
    width = 20;   // Increased width to make the model wider
    height = 10;  // Increased height to make the model thicker

    // Create the rectangular prism with sharper edges
    cube([length, width, height], center = true);
}

// Main function to render the model
// Adjusted orientation to align with the original model
rotate([0, 0, 0])  // No rotation applied to match the original orientation
component_name_1();
