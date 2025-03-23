
// Define parameters for the rectangular plate with a hole
plate_length = 50;  // Length of the rectangular plate
plate_width = 30;   // Width of the rectangular plate
plate_thickness = 5; // Thickness of the rectangular plate
hole_diameter = 20; // Diameter of the centered circular hole
layer_spacing = 10; // Spacing between layers

// Function to create a rectangular plate with a centered hole
module rectangular_plate_with_hole() {
    difference() {
        cube([plate_length, plate_width, plate_thickness], center = true);
        cylinder(r = hole_diameter / 2, h = plate_thickness + 1, center = true);
    }
}

// Generate the layers based on graph_dict
translate([0, 0, layer_spacing * 5]) rectangular_plate_with_hole(); // Layer 1
translate([0, 0, layer_spacing * 4]) rectangular_plate_with_hole(); // Layer 2
translate([0, 0, layer_spacing * 3]) rectangular_plate_with_hole(); // Layer 3
translate([0, 0, layer_spacing * 2]) rectangular_plate_with_hole(); // Layer 4
translate([0, 0, layer_spacing * 1]) rectangular_plate_with_hole(); // Layer 5
translate([0, 0, layer_spacing * 0]) rectangular_plate_with_hole(); // Layer 6

