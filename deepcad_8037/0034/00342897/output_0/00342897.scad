
// Define dimensions for components
module central_block() {
    cube([40, 20, 10], center = true);
}

module angled_connector() {
    difference() {
        cube([30, 10, 10], center = true);
        translate([0, 0, 5])
            rotate([0, 45, 0])
            cube([30, 10, 10], center = true);
    }
}

module flat_connector() {
    cube([30, 10, 5], center = true);
}

module spacer() {
    cube([30, 10, 2], center = true);
}

module bolt() {
    cylinder(h = 20, r = 1.5, center = true);
}

module nut() {
    translate([0, 0, -1])
        cylinder(h = 2, r = 3, center = true);
}

// Assemble the model
module flexible_coupling() {
    // Layer 1: Angled Connector 1
    translate([0, 0, 30])
        angled_connector();

    // Layer 2: Spacer 1
    translate([0, 0, 25])
        spacer();

    // Layer 3: Flat Connector 1
    translate([0, 0, 20])
        flat_connector();

    // Layer 4: Central Block
    translate([0, 0, 10])
        central_block();

    // Layer 5: Flat Connector 2
    translate([0, 0, 0])
        flat_connector();

    // Layer 6: Spacer 2
    translate([0, 0, -5])
        spacer();

    // Layer 7: Angled Connector 2
    translate([0, 0, -10])
        angled_connector();
}

// Render the model
flexible_coupling();

