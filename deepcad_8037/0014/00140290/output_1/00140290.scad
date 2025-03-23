
// Define dimensions for the rectangular flat plate
module rectangular_flat_plate() {
    translate([0, 0, 10])  // Adjusted position to match the original model
    cube([60, 40, 5], center = true);  // Dimensions: 60x40x5
}

// Define dimensions for the square plate with a hole
module square_plate_with_hole() {
    difference() {
        translate([0, 0, -10])  // Adjusted position to match the original model
        cube([20, 20, 5], center = true);  // Dimensions: 20x20x5
        translate([0, 0, -10])  // Center hole
        cylinder(r=5, h=5, center = true);
    }
}

// Assemble the components
module assembly() {
    rectangular_flat_plate();
    square_plate_with_hole();
}

// Render the assembly
assembly();

