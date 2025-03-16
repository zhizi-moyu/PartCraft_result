
// Plate dimensions
plate_length = 50;  // Adjust as needed
plate_width = 30;   // Adjust as needed
plate_thickness = 1; // Reduced thickness to match the original model
plate_spacing = 0.2; // Adjusted spacing to match the original model

// Module to create a single plate
module plate() {
    cube([plate_length, plate_width, plate_thickness], center=true);
}

// Generate the required number of plates
for (i = [0:5]) {
    translate([0, 0, i * (plate_thickness + plate_spacing)]) // Adjusted spacing
    plate();
}

