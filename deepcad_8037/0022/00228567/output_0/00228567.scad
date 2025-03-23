
// Parameters for the rectangular plate with slot
plate_length = 100;  // Length of the plate
plate_width = 50;    // Width of the plate
plate_thickness = 5; // Thickness of the plate
slot_length = 20;    // Length of the slot
slot_width = 10;     // Width of the slot
slot_offset = 10;    // Distance of the slot from the shorter edge of the plate
layer_spacing = 10;  // Spacing between layers

// Function to create a rectangular plate with a slot
module rectangular_plate_with_slot() {
    difference() {
        // Main rectangular plate
        cube([plate_length, plate_width, plate_thickness], center = true);
        
        // Slot
        translate([0, plate_width / 2 - slot_offset - slot_width / 2, 0])
            cube([slot_length, slot_width, plate_thickness + 1], center = true);
    }
}

// Assemble the layers
module flexible_coupling() {
    for (i = [0:5]) {
        translate([0, 0, -i * (plate_thickness + layer_spacing)])
            rectangular_plate_with_slot();
    }
}

// Render the model
flexible_coupling();

