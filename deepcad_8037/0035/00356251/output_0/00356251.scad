
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
    translate([0, 0, 150]) // Position at the top
        tall_narrow_block();

    // Layer 2: short_wide_block_1
    translate([0, 0, 100]) // Positioned directly below the first tall and narrow block
        short_wide_block();

    // Layer 3: medium_block_1
    translate([10, 10, 70]) // Positioned below the first short and wide block
        medium_block();

    // Layer 4: medium_block_2
    translate([10, 10, 40]) // Positioned below the first medium block
        medium_block();

    // Layer 5: short_wide_block_2
    translate([0, 0, 10]) // Positioned below the second medium block
        short_wide_block();

    // Layer 6: tall_narrow_block_2
    translate([0, 0, 0]) // Positioned at the bottom of the assembly
        tall_narrow_block();
}

// Render the assembly
assembly();

