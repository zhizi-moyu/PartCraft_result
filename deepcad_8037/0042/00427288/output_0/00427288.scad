
// Define parameters for the flat square plate
plate_size = 50; // Length and width of the square plate
plate_thickness = 5; // Thickness of the plate
plate_spacing = 10; // Spacing between each plate

// Function to create a flat square plate
module flat_square_plate() {
    cube([plate_size, plate_size, plate_thickness], center = true);
}

// Assembly of the flexible coupling
module flexible_coupling() {
    // Layer 1: Topmost plate
    translate([0, 0, plate_spacing * 2.5])
        flat_square_plate();

    // Layer 2: Second plate
    translate([0, 0, plate_spacing * 1.5])
        flat_square_plate();

    // Layer 3: Third plate
    translate([0, 0, plate_spacing * 0.5])
        flat_square_plate();

    // Layer 4: Fourth plate
    translate([0, 0, -plate_spacing * 0.5])
        flat_square_plate();

    // Layer 5: Fifth plate
    translate([0, 0, -plate_spacing * 1.5])
        flat_square_plate();

    // Layer 6: Bottommost plate
    translate([0, 0, -plate_spacing * 2.5])
        flat_square_plate();
}

// Render the flexible coupling
flexible_coupling();

