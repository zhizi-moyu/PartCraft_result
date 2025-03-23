
// Define the dimensions of the flat plate
module flat_plate(length = 50, width = 50, thickness = 2) {
    cube([length, width, thickness], center = true);
}

// Stack the flat plates vertically
module stacked_flat_plates(num_plates = 6, spacing = 5) {
    for (i = [0 : num_plates - 1]) {
        translate([0, 0, i * spacing])
            flat_plate();
    }
}

// Generate the 3D model
stacked_flat_plates();

