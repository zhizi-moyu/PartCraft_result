
// Define dimensions for each component
module elongated_block() {
    cube([10, 3, 40], center = true); // Increased thickness
}

module rectangular_block_4() {
    cube([10, 2, 20], center = true);
}

module rectangular_block_3() {
    cube([10, 2, 22], center = true); // Reduced elongation
}

module cube_1() {
    cube([12, 12, 12], center = true); // Increased size
}

module rectangular_block_2() {
    cube([10, 2, 20], center = true);
}

module rectangular_block_1() {
    cube([10, 3, 15], center = true); // Increased thickness
}

// Assemble the model based on the positional relationship
module flexible_coupling() {
    // Layer 1: elongated_block
    translate([0, 0, 55]) elongated_block(); // Lowered position
    
    // Layer 2: rectangular_block_4
    translate([0, 0, 35]) rectangular_block_4(); // Increased distance from rectangular_block_3
    
    // Layer 3: rectangular_block_3
    translate([5, 0, 15]) rectangular_block_3(); // Adjusted position to the right
    
    // Layer 4: cube_1
    translate([0, 0, -5]) cube_1(); // Lowered position
    
    // Layer 5: rectangular_block_2
    rotate([0, 0, 0]) translate([0, 0, -25]) rectangular_block_2(); // Restored original orientation
    
    // Layer 6: rectangular_block_1
    translate([0, 0, -45]) rectangular_block_1(); // Adjusted position downward
}

// Render the model
flexible_coupling();

