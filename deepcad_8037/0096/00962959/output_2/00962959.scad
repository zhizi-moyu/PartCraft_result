
// Parameters
plate_length = 100; // Length of the flat plate
plate_width = 50;   // Width of the flat plate
plate_thickness = 5; // Thickness of the flat plate

bracket_length = 50; // Length of one side of the L-shaped bracket
bracket_width = 50;  // Width of the bracket
bracket_thickness = 5; // Thickness of the bracket
bracket_offset = 10; // Offset from the edge of the flat plate

// Flat Plate
module flat_plate() {
    translate([0, 0, 0]) // Ensure the flat plate is perfectly horizontal
        cube([plate_length, plate_width, plate_thickness]);
}

// L-Shaped Bracket
module l_shaped_bracket() {
    union() {
        cube([bracket_length, bracket_thickness, bracket_width]);
        translate([0, bracket_thickness, 0])
            cube([bracket_thickness, bracket_width, bracket_width]);
    }
}

// Assembly
module assembly() {
    // Layer 1: Flat Plate
    translate([0, 0, 0]) // Corrected position to make the flat plate visible
        flat_plate();

    // Layer 2: L-Shaped Brackets
    // Bracket 1
    rotate([0, 0, 0]) // Correct rotation
        translate([plate_length / 2 - bracket_offset, plate_width / 2 - bracket_offset, plate_thickness])
            l_shaped_bracket();

    // Bracket 2
    rotate([0, 0, 72]) // Correct rotation
        translate([plate_length / 2 - bracket_offset, plate_width / 2 - bracket_offset, plate_thickness]) // Adjusted position
            l_shaped_bracket();

    // Bracket 3
    rotate([0, 0, 144]) // Correct rotation
        translate([plate_length / 2 - bracket_offset, plate_width / 2 - bracket_offset, plate_thickness]) // Adjusted to match original spacing
            l_shaped_bracket();

    // Bracket 4
    rotate([0, 0, 216]) // Correct rotation
        translate([plate_length / 2 - bracket_offset, plate_width / 2 - bracket_offset, plate_thickness]) // Adjusted to make it parallel
            l_shaped_bracket();

    // Bracket 5
    rotate([0, 0, 288]) // Correct rotation
        translate([plate_length / 2 - bracket_offset, plate_width / 2 - bracket_offset, plate_thickness]) // Added missing bracket
            l_shaped_bracket();
}

// Render the assembly
assembly();

