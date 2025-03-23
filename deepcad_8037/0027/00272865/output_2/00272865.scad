// Define dimensions for the step block
module step_block() {
    // Bottommost level
    cube([30, 30, 10], center = false);
    
    // Middle level
    translate([5, 5, 10])  // Adjusted position for proper alignment
        cube([20, 20, 10], center = false);
    
    // Topmost level
    translate([10, 10, 20])  // Adjusted position for proper alignment
        cube([10, 10, 10], center = false);
}

// Call the step_block module to render the model
step_block();
