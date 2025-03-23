
// Parameters for the rectangular plate
plate_length = 50;  // Length of the plate
plate_width = 30;   // Width of the plate
plate_thickness = 2; // Thickness of the plate
layer_spacing = 5;  // Spacing between layers

// Function to create a rectangular plate
module rectangular_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Generate the stack of rectangular plates
translate([0, 0, layer_spacing * 5]) rectangular_plate(); // Layer 1 (topmost)
translate([0, 0, layer_spacing * 4]) rectangular_plate(); // Layer 2
translate([0, 0, layer_spacing * 3]) rectangular_plate(); // Layer 3
translate([0, 0, layer_spacing * 2]) rectangular_plate(); // Layer 4
translate([0, 0, layer_spacing * 1]) rectangular_plate(); // Layer 5
translate([0, 0, layer_spacing * 0]) rectangular_plate(); // Layer 6 (bottommost)

