// Spacer Plate
module spacer_plate() {
    // Dimensions based on the description and visual estimation
    square_size = 50; // Length of the square side
    thickness = 5;    // Thickness of the plate

    // Create a solid square plate (removing the circular cutout)
    cube([square_size, square_size, thickness], center = true);
}

// Render the spacer plate
spacer_plate();
