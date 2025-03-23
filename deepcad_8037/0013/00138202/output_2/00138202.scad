
// Define the dimensions of the rectangular plate
plate_length = 100;  // Length of the plate
plate_width = 20;    // Width of the plate
plate_thickness = 3; // Thickness of the plate

// Function to create a rectangular plate
module rectangular_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Assemble the individual rectangular plates
module assembly() {
    // Position each plate individually without stacking
    translate([-50, 0, 0]) rectangular_plate(); // First plate
    translate([-30, 0, 0]) rectangular_plate(); // Second plate
    translate([-10, 0, 0]) rectangular_plate(); // Third plate
    translate([10, 0, 0]) rectangular_plate();  // Fourth plate
    translate([30, 0, 0]) rectangular_plate();  // Fifth plate
    translate([50, 0, 0]) rectangular_plate();  // Sixth plate
}

// Render the assembly
assembly();

