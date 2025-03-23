module stepped_block() {
    difference() {
        // Base block
        cube([60, 60, 60]);
        
        // Adjusted to include six evenly spaced steps with uniform height and depth
        for (i = [0:5]) {
            translate([0, i * 10, 0])
                cube([60, 10, 10 * (i + 1)]);
        }
    }
}

// Call the module to render the stepped block
stepped_block();
