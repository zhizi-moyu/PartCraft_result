
// Parameters for the rectangular plate
plate_length = 50;  // Length of the plate
plate_width = 30;   // Width of the plate
plate_thickness = 2; // Thickness of the plate
plate_spacing = 10;  // Spacing between plates

// Function to create a rectangular plate
module rectangular_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Generate the individual plates in a vertical orientation
translate([0, 0, 0]) rotate([90, 0, 0]) rectangular_plate(); // Plate 1
translate([0, plate_spacing, 0]) rotate([90, 0, 0]) rectangular_plate(); // Plate 2
translate([0, plate_spacing * 2, 0]) rotate([90, 0, 0]) rectangular_plate(); // Plate 3
translate([0, plate_spacing * 3, 0]) rotate([90, 0, 0]) rectangular_plate(); // Plate 4
translate([0, plate_spacing * 4, 0]) rotate([90, 0, 0]) rectangular_plate(); // Plate 5
translate([0, plate_spacing * 5, 0]) rotate([90, 0, 0]) rectangular_plate(); // Plate 6

