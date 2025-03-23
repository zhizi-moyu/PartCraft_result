
// Define the size of the cube
cube_size = 10; // Adjust the size as needed

// Function to create a single cube
module cube_component() {
    cube([cube_size, cube_size, cube_size], center = true);
}

// Arrange six identical cubes in a uniform vertical position
module layer_1() {
    for (i = [0:5]) {
        translate([0, 0, 0]) // All cubes occupy the same position
        cube_component();
    }
}

// Render the model
layer_1();

