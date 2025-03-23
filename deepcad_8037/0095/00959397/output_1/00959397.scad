// Parameters for the zigzag plate
plate_length = 60;  // Length of each segment of the plate
plate_width = 20;   // Width of the plate
plate_thickness = 5; // Thickness of the plate
bend_angle = 60;    // Adjusted angle of the bends in degrees for sharper Z-like structure
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
    translate([plate_length + plate_length * cos(bend_angle), 0, plate_thickness + plate_length * sin(bend_angle)])
    rotate([0, -bend_angle, 0])
    cube([plate_length, plate_width, plate_thickness], center = false);
}

// Call the zigzag_plate module to render the model
zigzag_plate();
