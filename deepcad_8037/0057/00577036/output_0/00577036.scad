
// Plate dimensions
plate_length = 50;  // Adjust as needed
plate_width = 30;   // Adjust as needed
plate_thickness = 2; // Adjust as needed

// Module to create a single plate
module plate() {
    cube([plate_length, plate_width, plate_thickness], center=true);
}

// Generate the required number of plates
for (i = [0:5]) {
    translate([0, 0, i * (plate_thickness + 1)]) // Adjust spacing if needed
    plate();
}

