
// Define dimensions for each component
module central_block() {
    difference() {
        cube([40, 20, 10], center = true);
        translate([0, 0, 5])
            cube([30, 20, 5], center = true);
    }
}

module side_block() {
    difference() {
        cube([40, 20, 10], center = true);
        translate([15, 0, 5])
            cube([10, 20, 5], center = true);
    }
}

module spacer_block() {
    difference() {
        cube([20, 10, 5], center = true);
        translate([0, 0, 2.5])
            cube([15, 10, 2.5], center = true);
    }
}

module end_block() {
    cube([20, 10, 5], center = true);
}

// Assemble the components based on the positional relationship
module assembly() {
    translate([0, 0, 15]) end_block(); // Layer 1
    translate([0, 0, 10]) spacer_block(); // Layer 2
    translate([0, 0, 0]) central_block(); // Layer 3
    translate([0, 0, -10]) side_block(); // Layer 4
}

// Render the assembly
assembly();

