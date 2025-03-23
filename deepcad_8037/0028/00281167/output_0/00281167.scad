
// Define dimensions for each cuboid
large_cuboid_size = [40, 20, 10];  // Dimensions for the large cuboid
medium_cuboid_size = [30, 15, 10]; // Dimensions for the medium cuboid
small_cuboid_size = [20, 10, 10];  // Dimensions for the small cuboid

// Define positions for each layer
large_cuboid_position = [0, 0, 0];  // Base layer (layer_3)
medium_cuboid_position = [0, 0, large_cuboid_size[2]]; // Intermediate layer (layer_2)
small_cuboid_position = [0, 0, large_cuboid_size[2] + medium_cuboid_size[2]]; // Top layer (layer_1)

// Create the large cuboid
translate(large_cuboid_position)
    cube(large_cuboid_size, center = true);

// Create the medium cuboid
translate(medium_cuboid_position)
    cube(medium_cuboid_size, center = true);

// Create the small cuboid
translate(small_cuboid_position)
    cube(small_cuboid_size, center = true);

