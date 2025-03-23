
// Parameters for the rectangular plate
plate_length = 50;  // Length of the plate
plate_width = 30;   // Width of the plate
plate_thickness = 2; // Thickness of the plate
layer_spacing = 20;  // Spacing between layers (adjusted to separate plates)

// Function to create a rectangular plate
module rectangular_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Generate the individual rectangular plates with spacing
translate([0, 0, layer_spacing * 0]) rectangular_plate(); // Plate 1 (bottommost)
translate([0, 0, layer_spacing * 1]) rectangular_plate(); // Plate 2
translate([0, 0, layer_spacing * 2]) rectangular_plate(); // Plate 3
translate([0, 0, layer_spacing * 3]) rectangular_plate(); // Plate 4
translate([0, 0, layer_spacing * 4]) rectangular_plate(); // Plate 5
translate([0, 0, layer_spacing * 5]) rectangular_plate(); // Plate 6 (topmost)

