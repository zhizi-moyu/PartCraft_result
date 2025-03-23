
// Define parameters for the flat square plate
plate_size = 50; // Length and width of the square plate
plate_thickness = 5; // Thickness of the plate
gap = 3; // Gap between each plate

// Function to create a flat square plate
module flat_square_plate() {
    cube([plate_size, plate_size, plate_thickness], center = true);
}

// Render six flat square plates with uniform gaps between them
for (i = [0:5]) {
    translate([0, 0, i * (plate_thickness + gap)])
        flat_square_plate();
}

