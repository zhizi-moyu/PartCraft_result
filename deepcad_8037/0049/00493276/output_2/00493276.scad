
// Define dimensions for the rectangular block
block_length = 60;  // Length of the block
block_width = 40;   // Width of the block
block_height = 25;  // Updated height (thickness) of the block to match the original model

// Define corner radius for rounded edges
corner_radius = 2;  // Slightly round the edges to match the original model

// Create the rectangular block with rounded edges
module rectangular_block() {
    hull() {
        translate([-block_length/2 + corner_radius, -block_width/2 + corner_radius, -block_height/2]) 
            sphere(corner_radius);
        translate([block_length/2 - corner_radius, -block_width/2 + corner_radius, -block_height/2]) 
            sphere(corner_radius);
        translate([-block_length/2 + corner_radius, block_width/2 - corner_radius, -block_height/2]) 
            sphere(corner_radius);
        translate([block_length/2 - corner_radius, block_width/2 - corner_radius, -block_height/2]) 
            sphere(corner_radius);
        translate([-block_length/2 + corner_radius, -block_width/2 + corner_radius, block_height/2]) 
            sphere(corner_radius);
        translate([block_length/2 - corner_radius, -block_width/2 + corner_radius, block_height/2]) 
            sphere(corner_radius);
        translate([-block_length/2 + corner_radius, block_width/2 - corner_radius, block_height/2]) 
            sphere(corner_radius);
        translate([block_length/2 - corner_radius, block_width/2 - corner_radius, block_height/2]) 
            sphere(corner_radius);
    }
}

// Adjust the orientation and position to ensure alignment and symmetry
rotate([0, 0, 15]) {  // Adjusted rotation to match the original model’s angle
    translate([0, 0, 5]) {  // Adjusted position to match the original model’s placement
        rectangular_block();
    }
}

