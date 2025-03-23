
// Define dimensions for the rectangular plate
plate_length = 105;  // Adjusted length of the plate to increase surface area
plate_width = 65;    // Adjusted width of the plate to increase surface area
plate_thickness = 5; // Thickness of the plate remains uniform

// Create the rectangular plate with sharp edges
module rectangular_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Render the model
// Ensure the plate is flat and parallel to the ground
translate([0, 0, plate_thickness / 2]) {
    rectangular_plate();
}

