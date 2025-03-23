
// Parameters for the rectangular plate
plate_length = 50;  // Length of the plate
plate_width = 10;   // Width of the plate
plate_thickness = 2; // Thickness of the plate
spacing = 15;       // Spacing between plates

// Function to create a rectangular plate
module rectangular_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Generate the six rectangular plates in the same vertical layer
// Adjusted to ensure plates are parallel, evenly spaced, and at the same height
translate([0, -spacing * 2.5, 0]) rectangular_plate(); // Plate 1
translate([0, -spacing * 1.5, 0]) rectangular_plate(); // Plate 2
translate([0, -spacing * 0.5, 0]) rectangular_plate(); // Plate 3
translate([0, spacing * 0.5, 0]) rectangular_plate();  // Plate 4
translate([0, spacing * 1.5, 0]) rectangular_plate();  // Plate 5
translate([0, spacing * 2.5, 0]) rectangular_plate();  // Plate 6

