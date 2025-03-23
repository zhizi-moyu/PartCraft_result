
// Parameters for the flat rectangular plate with slot
plate_length = 100;  // Length of the plate
plate_width = 50;    // Width of the plate
plate_thickness = 5; // Thickness of the plate
slot_length = 20;    // Length of the slot
slot_width = 10;     // Width of the slot
slot_offset = 10;    // Distance of the slot from the shorter edge

// Module to create the flat rectangular plate with slot
module flat_rectangular_plate_with_slot() {
    // Create the main rectangular plate
    difference() {
        cube([plate_length, plate_width, plate_thickness], center = true);
        
        // Create the slot
        translate([slot_offset - plate_length / 2 + slot_length / 2, 0, plate_thickness / 2])
            cube([slot_length, slot_width, plate_thickness + 1], center = true);
    }
}

// Render the model
flat_rectangular_plate_with_slot();

