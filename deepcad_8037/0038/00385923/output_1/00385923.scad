
// Define the cube dimensions
cube_size = 10; // Adjust the size as needed to match the images

// Generate the cube with sharp edges and equal square faces
translate([0, 0, 0]) // Adjust position to match alignment and orientation
cube([cube_size, cube_size, cube_size], center = true); // Center the cube for uniform alignment

