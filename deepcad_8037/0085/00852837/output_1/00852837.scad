
// Define dimensions for the blocks
large_block = [60, 30, 20];  // Length, Width, Height
medium_block = [40, 20, 20];
small_block = [20, 20, 20];

// Define spacing between blocks
spacing = 5;

// Layer 1: Small rectangular blocks
translate([-(small_block[0] + spacing) / 2, 0, large_block[2] + medium_block[2]])
    cube(small_block, center = true);
translate([(small_block[0] + spacing) / 2, 0, large_block[2] + medium_block[2]])
    cube(small_block, center = true);

// Layer 2: Medium rectangular blocks
translate([-(medium_block[0] + spacing) / 2, 0, large_block[2]])
    cube(medium_block, center = true);
translate([(medium_block[0] + spacing) / 2, 0, large_block[2]])
    cube(medium_block, center = true);

// Layer 3: Large rectangular blocks
translate([-(large_block[0] + spacing) / 2, 0, 0])
    cube(large_block, center = true);
translate([(large_block[0] + spacing) / 2, 0, 0])
    cube(large_block, center = true);

