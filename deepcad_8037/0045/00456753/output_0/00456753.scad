
// Base Plate
module base_plate() {
    cube([100, 50, 5], center = true); // Dimensions: 100x50x5
}

// L-Shaped Bracket
module l_shaped_bracket() {
    difference() {
        union() {
            cube([40, 5, 20], center = true); // Vertical part
            translate([0, 10, -10])
                cube([40, 20, 5], center = true); // Horizontal part
        }
        translate([0, 10, -10])
            cube([40, 5, 5], center = true); // Cutout for the lip
    }
}

// Fastener (Cylindrical Bolt)
module fastener() {
    cylinder(h = 10, r = 2, center = true); // Height: 10, Radius: 2
}

// Assembly
module assembly() {
    // Layer 3: Base Plate
    base_plate();

    // Layer 1: L-Shaped Brackets
    for (i = [0:3]) {
        rotate([0, 0, i * 90]) // Rotate to position brackets
            translate([40, 0, 12.5]) // Position brackets on the base plate
                l_shaped_bracket();
    }

    // Layer 2: Fasteners
    for (i = [0:3]) {
        rotate([0, 0, i * 90]) // Rotate to position fasteners
            translate([40, 0, 2.5]) // Position fasteners on the base plate
                fastener();
    }
}

// Render the assembly
assembly();

