
// Base block with recessed square cavity and sloped edge
module base_block() {
    difference() {
        // Main rectangular block
        cube([50, 50, 20], center = false);
        
        // Recessed square cavity
        translate([10, 10, 0])
            cube([30, 30, 10], center = false);
        
        // Sloped edge on one side of the cavity
        translate([10, 10, 10])
            linear_extrude(height = 10)
                polygon(points = [[0, 0], [30, 0], [30, 30], [15, 30]]);
    }
}

// Top plate
module top_plate() {
    translate([0, 0, 20]) // Position above the base block
        cube([50, 50, 5], center = false);
}

// Assemble the components
module assembly() {
    base_block();
    top_plate();
}

// Render the assembly
assembly();

