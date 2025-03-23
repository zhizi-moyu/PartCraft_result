
// Parameters for the rectangular plate
plate_length = 50;  // Length of the plate
plate_width = 30;   // Width of the plate
plate_thickness = 2; // Thickness of the plate
plate_spacing = 5;  // Spacing between plates

// Function to create a rectangular plate
module rectangular_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Stack the plates based on the positional relationship
translate([0, 0, plate_spacing * 5]) rectangular_plate(); // Layer 1
translate([0, 0, plate_spacing * 4]) rectangular_plate(); // Layer 2
translate([0, 0, plate_spacing * 3]) rectangular_plate(); // Layer 3
translate([0, 0, plate_spacing * 2]) rectangular_plate(); // Layer 4
translate([0, 0, plate_spacing * 1]) rectangular_plate(); // Layer 5
translate([0, 0, plate_spacing * 0]) rectangular_plate(); // Layer 6

