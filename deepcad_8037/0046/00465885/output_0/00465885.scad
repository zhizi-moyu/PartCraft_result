
// Parameters for the flat plate
plate_length = 50;  // Length of the longer side
plate_short_length = 40;  // Length of the shorter side
plate_height = 30;  // Height of the trapezoid
plate_thickness = 2;  // Thickness of the plate
plate_offset = 5;  // Offset for the slanted edge
layer_spacing = 5;  // Spacing between layers

// Function to create a single flat plate
module flat_plate() {
    polygon(points=[
        [0, 0], 
        [plate_length, 0], 
        [plate_short_length, plate_height], 
        [plate_offset, plate_height]
    ]);
    linear_extrude(height=plate_thickness) {
        polygon(points=[
            [0, 0], 
            [plate_length, 0], 
            [plate_short_length, plate_height], 
            [plate_offset, plate_height]
        ]);
    }
}

// Assembly of the flat plates in layers
module assembly() {
    for (i = [0:5]) {
        translate([0, 0, i * (plate_thickness + layer_spacing)]) {
            flat_plate();
        }
    }
}

// Render the assembly
assembly();

