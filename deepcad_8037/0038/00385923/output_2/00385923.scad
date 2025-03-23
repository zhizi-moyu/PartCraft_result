
// Define the cube dimensions
cube_size = 10; // Adjust the size as needed to match the images

// Generate the cube with sharp edges and equal square faces
// Ensure the cube is perfectly aligned with the axes
translate([0, 0, 0]) // Adjust position to match alignment and orientation
    rotate([0, 0, 0]) // Remove any tilt or skew by setting rotation to zero
        cube([cube_size, cube_size, cube_size], center = true); // Center the cube for uniform alignment

