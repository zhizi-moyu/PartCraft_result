
// Define the dimensions of the flat plate
module flat_plate(length = 50, width = 50, thickness = 2) {
    cube([length, width, thickness], center = true);
}

// Generate the 3D model
flat_plate();

