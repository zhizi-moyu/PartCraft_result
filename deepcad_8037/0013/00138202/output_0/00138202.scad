
// Define the dimensions of the rectangular plate
plate_length = 100;  // Length of the plate
plate_width = 20;    // Width of the plate
plate_thickness = 5; // Thickness of the plate
plate_spacing = 10;  // Spacing between each plate

// Function to create a rectangular plate
module rectangular_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Assemble the layers of rectangular plates
module assembly() {
    for (i = [0:5]) {
        translate([0, 0, -i * (plate_thickness + plate_spacing)])
            rectangular_plate();
    }
}

// Render the assembly
assembly();

