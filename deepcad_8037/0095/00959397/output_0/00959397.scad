
// Parameters for the zigzag plate
plate_length = 60;  // Length of each segment of the plate
plate_width = 20;   // Width of the plate
plate_thickness = 5; // Thickness of the plate
bend_angle = 45;    // Angle of the bends in degrees
bend_offset = plate_thickness / tan(bend_angle); // Offset for the bend

module zigzag_plate() {
    // First segment
    translate([0, 0, 0])
    cube([plate_length, plate_width, plate_thickness], center = false);

    // Second segment (angled)
    translate([plate_length, 0, plate_thickness])
    rotate([0, bend_angle, 0])
    cube([plate_length, plate_width, plate_thickness], center = false);

    // Third segment
    translate([plate_length + bend_offset, 0, plate_thickness + bend_offset])
    rotate([0, 2 * bend_angle, 0])
    cube([plate_length, plate_width, plate_thickness], center = false);
}

// Call the zigzag_plate module to render the model
zigzag_plate();

