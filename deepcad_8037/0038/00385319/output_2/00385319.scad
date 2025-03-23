
// Base block with recessed square cavity and sloped edge
module base_block() {
    difference() {
        // Main rectangular block
        cube([50, 50, 20], center = false);
        
        // Recessed square cavity on the top surface
        translate([10, 10, 10]) // Move cavity to the top surface
            cube([30, 30, 10], center = false);
        
        // Sloped edge on one side of the cavity
        translate([10, 10, 10])
            linear_extrude(height = 10)
                polygon(points = [[0, 0], [30, 0], [30, 10], [10, 30], [0, 30]]);
    }
}

// Top plate
module top_plate() {
    // Adjusted thickness and position to fit into the recessed cavity
    translate([10, 10, 10]) // Position inside the recessed cavity
        cube([30, 30, 5], center = false); // Reduced thickness
}

// Assemble the components
module assembly() {
    base_block();
    top_plate();
}

// Render the assembly
assembly();

