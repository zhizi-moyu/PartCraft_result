
// Define dimensions for the blocks
large_block_size = [60, 30, 10];  // [length, width, height]
medium_block_size = [40, 20, 10];
small_block_size = [20, 10, 10];

// Define positions for each layer
layer_1_position = [0, 0, 50];  // Topmost layer
layer_2_position = [0, 0, 40];
layer_3_position = [0, 0, 30];
layer_4_position = [0, 0, 20];
layer_5_position = [0, 0, 10];
layer_6_position = [0, 0, 0];   // Bottommost layer

// Create the blocks and position them according to the graph_dict
module large_rectangular_block() {
    cube(large_block_size, center = true);
}

module medium_rectangular_block() {
    cube(medium_block_size, center = true);
}

module small_rectangular_block() {
    cube(small_block_size, center = true);
}

// Assemble the model
translate(layer_1_position) large_rectangular_block();
translate(layer_2_position) medium_rectangular_block();
translate(layer_3_position) small_rectangular_block();
translate(layer_4_position) small_rectangular_block();
translate(layer_5_position) medium_rectangular_block();
translate(layer_6_position) large_rectangular_block();

