
// Parameters for the rectangular plate
plate_width = 20;  // Width of the rectangular plate
plate_height = 50; // Height of the rectangular plate
plate_thickness = 5; // Thickness of the rectangular plate

// Function to create a single rectangular plate
module rectangular_plate() {
    cube([plate_width, plate_thickness, plate_height], center = true);
}

// Main assembly
module assembly() {
    for (i = [0:5]) {
        rotate([0, 0, i * 60]) // Rotate each plate by 60 degrees around the Z-axis
        translate([0, 0, 0]) // Position the plates at the origin
        rectangular_plate();
    }
}

// Call the assembly module to render the model
assembly();

