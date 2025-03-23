
// Define the dimensions of the rectangular plate
plate_length = 50;  // Length of the plate
plate_width = 10;   // Width of the plate
plate_thickness = 2; // Thickness of the plate

// Define the spacing between plates
plate_spacing = 15; // Distance between adjacent plates

// Function to create a rectangular plate
module rectangular_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Generate the 3D model with six rectangular plates
translate([0, 0, 0]) rectangular_plate(); // Plate 1
translate([0, plate_spacing, 0]) rectangular_plate(); // Plate 2
translate([0, 2 * plate_spacing, 0]) rectangular_plate(); // Plate 3
translate([0, 3 * plate_spacing, 0]) rectangular_plate(); // Plate 4
translate([0, 4 * plate_spacing, 0]) rectangular_plate(); // Plate 5
translate([0, 5 * plate_spacing, 0]) rectangular_plate(); // Plate 6

