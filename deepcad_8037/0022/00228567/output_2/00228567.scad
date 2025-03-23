
// Parameters for the rectangular plate with slot
plate_length = 100;  // Length of the plate
plate_width = 50;    // Width of the plate
plate_thickness = 5; // Thickness of the plate
slot_length = 20;    // Length of the slot
slot_width = 10;     // Width of the slot
slot_offset = 10;    // Distance of the slot from the shorter edge of the plate

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

// Render the model
rectangular_plate_with_slot();

