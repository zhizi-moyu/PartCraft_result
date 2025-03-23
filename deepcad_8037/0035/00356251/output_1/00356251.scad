
// Define dimensions for each component
module tall_narrow_block() {
    cube([10, 10, 50]); // Width: 10, Depth: 10, Height: 50
}

module short_wide_block() {
    cube([50, 50, 10]); // Width: 50, Depth: 50, Height: 10
}

module medium_block() {
    cube([30, 30, 30]); // Width: 30, Depth: 30, Height: 30
}

// Assemble the model based on the positional relationships
module assembly() {
    // Layer 1: tall_narrow_block_1
    translate([5, 5, 150]) // Adjusted position to align vertically and closer
        tall_narrow_block();

    // Layer 2: short_wide_block_1
    translate([0, 0, 100]) // Corrected alignment to remove rotation
        short_wide_block();

    // Layer 3: medium_block_1
    translate([10, 10, 70]) // Adjusted height to match symmetry
        medium_block();

    // Layer 4: medium_block_2
    translate([10, 10, 70]) // Adjusted height to match symmetry
        medium_block();

    // Layer 5: short_wide_block_2
    translate([0, 0, 10]) // Corrected alignment to remove rotation
        short_wide_block();

    // Layer 6: tall_narrow_block_2
    translate([5, 5, 0]) // Adjusted position to align vertically and closer
        tall_narrow_block();
}

// Render the assembly
assembly();

