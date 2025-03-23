
// Define the dimensions of the rectangular plate
module rectangular_plate(length=50, width=10, thickness=2) {
    cube([length, width, thickness], center=true);
}

// Generate the 3D model with 6 rectangular plates
module flexible_coupling() {
    for (i = [0:5]) {
        rotate([0, 0, i * 60])  // Rotate each plate by 60 degrees around the Z-axis
        translate([0, 0, 0])    // Keep all plates at the same layer (layer_1)
        rectangular_plate();
    }
}

// Call the flexible_coupling module to render the model
flexible_coupling();

