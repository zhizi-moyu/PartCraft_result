module stepped_block() {
    difference() {
        // Base block
        cube([60, 60, 60]);
        
        // Iteratively cut out the steps
        for (i = [0:5]) {
            translate([0, i * 10, 0])
                cube([60, 10, 10 * (i + 1)]);
        }
    }
}

// Call the module to render the stepped block
stepped_block();
