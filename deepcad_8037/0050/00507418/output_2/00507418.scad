
// Define the dimensions of the rectangular plate
plate_length = 50;  // Length of the plate
plate_width = 10;   // Width of the plate
plate_thickness = 1; // Thickness of the plate
spacing = 15;       // Spacing between each plate

// Function to create a rectangular plate
module rectangular_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Assemble the plates based on the differences_list
module assembly() {
    translate([0, 0, 0]) rectangular_plate();               // Plate 1
    translate([0, 0, -spacing]) rectangular_plate();         // Plate 2
    translate([0, 0, -2 * spacing]) rectangular_plate();     // Plate 3
    translate([0, 0, -3 * spacing]) rectangular_plate();     // Plate 4
    translate([0, 0, -4 * spacing]) rectangular_plate();     // Plate 5
    translate([0, 0, -5 * spacing]) rectangular_plate();     // Plate 6
}

// Render the assembly
assembly();

