// Parameters for the teeth_plate
plate_length = 60;  // Length of the rectangular plate
plate_width = 10;   // Width of the rectangular plate
plate_thickness = 2; // Thickness of the rectangular plate
tooth_width = 8;    // Width of each tooth
tooth_height = 10;  // Height of each tooth
tooth_spacing = 7;  // Spacing between the teeth
num_teeth = 4;      // Number of teeth

module teeth_plate() {
    // Base plate
    cube([plate_length, plate_width, plate_thickness]);

    // Add teeth
    for (i = [0:num_teeth-1]) {
        translate([plate_length - (tooth_width + tooth_spacing) * (i + 1), 0, plate_thickness])
            cube([tooth_width, plate_width, tooth_height]);
    }
}

// Render the teeth_plate
teeth_plate();
