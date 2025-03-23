
// Dimensions for the cuboids
large_cuboid_size = [40, 20, 10];  // Length, Width, Height
medium_cuboid_size = [30, 15, 10];
small_cuboid_size = [20, 10, 10];

// Positions for the cuboids based on the layer structure
large_cuboid_position = [0, 0, 0];  // Base layer
medium_cuboid_position = [0, 0, large_cuboid_size[2]];  // Above the large cuboid
small_cuboid_position = [0, 0, large_cuboid_size[2] + medium_cuboid_size[2]];  // Above the medium cuboid

// Large cuboid (base)
translate(large_cuboid_position)
    cube(large_cuboid_size, center = true);

// Medium cuboid (intermediate layer)
translate(medium_cuboid_position)
    cube(medium_cuboid_size, center = true);

// Small cuboid (topmost layer)
translate(small_cuboid_position)
    cube(small_cuboid_size, center = true);

