
// Define the dimensions of the flat plate
module flat_plate(length = 50, width = 30, thickness = 2) {
    cube([length, width, thickness], center = true);
}

// Generate the 3D model
// Adjusted to ensure alignment, parallel orientation, consistent spacing, and correct overall height
module flexible_coupling() {
    for (i = [0:5]) {
        translate([0, 0, i * (2 + 1)]) // Stack plates with a consistent 1mm gap between them
            flat_plate();
    }
}

// Call the main module to render the model
flexible_coupling();

