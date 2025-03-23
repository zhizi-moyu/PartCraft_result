
// Define dimensions for each component
module elongated_block() {
    cube([10, 2, 40], center = true);
}

module rectangular_block_4() {
    cube([10, 2, 20], center = true);
}

module rectangular_block_3() {
    cube([10, 2, 25], center = true);
}

module cube_1() {
    cube([10, 10, 10], center = true);
}

module rectangular_block_2() {
    cube([10, 2, 20], center = true);
}

module rectangular_block_1() {
    cube([10, 2, 15], center = true);
}

// Assemble the model based on the positional relationship
module flexible_coupling() {
    // Layer 1: elongated_block
    translate([0, 0, 60]) elongated_block();
    
    // Layer 2: rectangular_block_4
    translate([0, 0, 40]) rectangular_block_4();
    
    // Layer 3: rectangular_block_3
    translate([0, 0, 20]) rectangular_block_3();
    
    // Layer 4: cube_1
    translate([0, 0, 0]) cube_1();
    
    // Layer 5: rectangular_block_2
    translate([0, 0, -20]) rectangular_block_2();
    
    // Layer 6: rectangular_block_1
    translate([0, 0, -40]) rectangular_block_1();
}

// Render the model
flexible_coupling();

