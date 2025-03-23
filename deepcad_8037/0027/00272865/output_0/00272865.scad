
// Define dimensions for the step block
module step_block() {
    // Bottommost level
    cube([30, 30, 10], center = false);
    
    // Middle level
    translate([0, 0, 10])  // Position above the bottommost level
        cube([20, 20, 10], center = false);
    
    // Topmost level
    translate([0, 0, 20])  // Position above the middle level
        cube([10, 10, 10], center = false);
}

// Call the step_block module to render the model
step_block();

