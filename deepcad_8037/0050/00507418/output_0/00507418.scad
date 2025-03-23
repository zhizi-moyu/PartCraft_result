
// Define the dimensions of the rectangular plate
plate_length = 50;  // Length of the plate
plate_width = 10;   // Width of the plate
plate_thickness = 2; // Thickness of the plate
spacing = 5;        // Spacing between each layer

// Function to create a rectangular plate
module rectangular_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Assemble the layers based on the graph_dict
module assembly() {
    translate([0, 0, spacing * 2.5]) rectangular_plate(); // layer_1
    translate([0, 0, spacing * 1.5]) rectangular_plate(); // layer_2
    translate([0, 0, spacing * 0.5]) rectangular_plate(); // layer_3
    translate([0, 0, -spacing * 0.5]) rectangular_plate(); // layer_4
    translate([0, 0, -spacing * 1.5]) rectangular_plate(); // layer_5
    translate([0, 0, -spacing * 2.5]) rectangular_plate(); // layer_6
}

// Render the assembly
assembly();

