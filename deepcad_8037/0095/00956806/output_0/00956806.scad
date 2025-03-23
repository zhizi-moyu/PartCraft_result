
// Parameters for the flat plates
plate_width = 50;  // Width of the plate
plate_length = 50; // Length of the plate
plate_thickness = 5; // Thickness of the plate
plate_spacing = 10; // Spacing between plates

// Function to create a flat plate
module flat_plate() {
    cube([plate_width, plate_length, plate_thickness], center = true);
}

// Assembly of the flexible coupling
module flexible_coupling() {
    // Layer 1: Topmost flat plate
    translate([0, 0, plate_spacing * 2.5])
        flat_plate();

    // Layer 2: Second flat plate
    translate([0, 0, plate_spacing * 1.5])
        flat_plate();

    // Layer 3: Third flat plate
    translate([0, 0, plate_spacing * 0.5])
        flat_plate();

    // Layer 4: Fourth flat plate
    translate([0, 0, -plate_spacing * 0.5])
        flat_plate();

    // Layer 5: Fifth flat plate
    translate([0, 0, -plate_spacing * 1.5])
        flat_plate();

    // Layer 6: Bottommost flat plate
    translate([0, 0, -plate_spacing * 2.5])
        flat_plate();
}

// Render the flexible coupling
flexible_coupling();

