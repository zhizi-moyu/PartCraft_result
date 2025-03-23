
// Define dimensions for each component
module elongated_block() {
    cube([10, 5, 40], center = true); // Increased thickness
}

module rectangular_block_4() {
    cube([10, 2, 25], center = true); // Adjusted elongation
}

module rectangular_block_3() {
    cube([10, 3, 22], center = true); // Adjusted thickness
}

module cube_1() {
    cube([15, 15, 15], center = true); // Increased size
}

module rectangular_block_2() {
    cube([10, 2, 20], center = true);
}

module rectangular_block_1() {
    cube([10, 2, 20], center = true); // Adjusted thickness and elongation
}

// Assemble the model based on the positional relationship
module flexible_coupling() {
    // Layer 1: elongated_block
    translate([0, 0, 50]) elongated_block(); // Lowered position
    
    // Layer 2: rectangular_block_4
    translate([0, 0, 30]) rectangular_block_4(); // Adjusted position
    
    // Layer 3: rectangular_block_3
    translate([0, 0, 10]) rectangular_block_3(); // Adjusted position
    
    // Layer 4: cube_1
    translate([0, 0, -10]) cube_1(); // Lowered position
    
    // Layer 5: rectangular_block_2
    rotate([0, 0, 0]) translate([0, 0, -30]) rectangular_block_2(); // Lowered position
    
    // Layer 6: rectangular_block_1
    rotate([0, 90, 0]) translate([0, 0, -50]) rectangular_block_1(); // Adjusted orientation and position
}

// Render the model
flexible_coupling();

