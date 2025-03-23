
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
    // Positioning the plates in a flat, parallel configuration
    translate([-30, 0, 0]) rectangular_plate(); // First plate
    translate([0, 0, 0]) rectangular_plate();   // Second plate
    translate([30, 0, 0]) rectangular_plate();  // Third plate
    translate([-30, 0, 50]) rectangular_plate(); // Fourth plate
    translate([0, 0, 50]) rectangular_plate();   // Fifth plate
    translate([30, 0, 50]) rectangular_plate();  // Sixth plate
}

// Call the assembly module to render the model
assembly();

