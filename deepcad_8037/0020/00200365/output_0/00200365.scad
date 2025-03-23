
// Define the dimensions of the rectangular plate
module rectangular_plate(length, width, thickness) {
    cube([length, width, thickness], center = true);
}

// Parameters for the rectangular plate
plate_length = 50;  // Length of the plate
plate_width = 30;   // Width of the plate
plate_thickness = 2; // Thickness of the plate

// Number of plates
num_plates = 6;

// Stack the plates uniformly in the same vertical alignment
for (i = [0 : num_plates - 1]) {
    translate([0, 0, i * plate_thickness])
        rectangular_plate(plate_length, plate_width, plate_thickness);
}

