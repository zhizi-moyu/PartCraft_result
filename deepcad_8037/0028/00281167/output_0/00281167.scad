
// Dimensions for the cuboids
large_cuboid_size = [40, 20, 10];  // [length, width, height]
medium_cuboid_size = [30, 15, 10];
small_cuboid_size = [20, 10, 10];

// Offsets for positioning the cuboids
layer_1_offset = [0, 0, large_cuboid_size[2] + medium_cuboid_size[2]];  // Top layer (small cuboid)
layer_2_offset = [0, 0, large_cuboid_size[2]];                         // Middle layer (medium cuboid)
layer_3_offset = [0, 0, 0];                                            // Bottom layer (large cuboid)

// Large cuboid (bottom layer)
translate(layer_3_offset)
    cube(large_cuboid_size, center = true);

// Medium cuboid (middle layer)
translate(layer_2_offset)
    cube(medium_cuboid_size, center = true);

// Small cuboid (top layer)
translate(layer_1_offset)
    cube(small_cuboid_size, center = true);

