
// Define the dimensions of the rectangular plate
plate_length = 50;  // Length of the plate
plate_width = 20;   // Width of the plate
plate_thickness = 2; // Thickness of the plate

// Define the spacing between the layers
layer_spacing = 0; // Set spacing to 0 to eliminate gaps and form a compact block

// Function to create a rectangular plate
module rectangular_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Assemble the layers of rectangular plates
module flexible_coupling() {
    for (i = [0:5]) {
        translate([0, 0, -i * plate_thickness]) { // Remove layer_spacing to ensure plates are closely aligned
            rotate([0, 0, 0]) // Ensure plates are perfectly aligned and parallel
                rectangular_plate();
        }
    }
}

// Render the flexible coupling
flexible_coupling();

