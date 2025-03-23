// Generate a spacer_ring component based on the description
module spacer_ring() {
    difference() {
        // Create the main outer ring
        cylinder(h=2, r=30, center=true);
        // Cut out the hollow center
        cylinder(h=3, r=15, center=true);
    }
}

// Call the spacer_ring module
spacer_ring();
