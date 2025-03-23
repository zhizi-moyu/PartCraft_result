
// Define the dimensions of the rectangular plate
plate_length = 100;  // Length of the plate
plate_width = 20;    // Width of the plate
plate_thickness = 3; // Thickness of the plate (reduced to match original model)
plate_spacing = 0;   // Spacing between each plate (eliminated to align plates flat and parallel)

// Function to create a rectangular plate
module rectangular_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Assemble the layers of rectangular plates
module assembly() {
    for (i = [0:5]) {
        translate([0, 0, -i * plate_thickness])  // Adjusted to eliminate gaps and ensure perfect alignment
            rectangular_plate();
    }
}

// Render the assembly
assembly();

