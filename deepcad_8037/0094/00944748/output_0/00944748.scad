
// Parameters
shaft_diameter = 10; // Diameter of input/output shafts
shaft_length = 40; // Length of input/output shafts
central_shaft_diameter = 12; // Diameter of central shaft
central_shaft_length = 50; // Length of central shaft
flange_outer_diameter = 30; // Outer diameter of flange plates
flange_inner_diameter = 15; // Inner diameter of flange plates
flange_thickness = 5; // Thickness of flange plates
spacer_ring_outer_diameter = 25; // Outer diameter of spacer rings
spacer_ring_inner_diameter = 15; // Inner diameter of spacer rings
spacer_ring_thickness = 10; // Thickness of spacer rings
bolt_diameter = 3; // Diameter of bolts
bolt_length = 60; // Length of bolts
nut_diameter = 6; // Diameter of nuts
nut_thickness = 3; // Thickness of nuts
bolt_hole_radius = 1.5; // Radius of bolt holes
bolt_hole_positions = [ [10, 10], [-10, 10], [-10, -10], [10, -10] ]; // Bolt hole positions

// Helper function to create a flange plate
module flange_plate() {
    difference() {
        cylinder(d=flange_outer_diameter, h=flange_thickness);
        cylinder(d=flange_inner_diameter, h=flange_thickness + 1);
        for (pos in bolt_hole_positions) {
            translate([pos[0], pos[1], 0])
                cylinder(d=bolt_hole_radius * 2, h=flange_thickness + 1);
        }
    }
}

// Helper function to create a spacer ring
module spacer_ring() {
    difference() {
        cylinder(d=spacer_ring_outer_diameter, h=spacer_ring_thickness);
        cylinder(d=spacer_ring_inner_diameter, h=spacer_ring_thickness + 1);
    }
}

// Helper function to create a bolt
module bolt() {
    cylinder(d=bolt_diameter, h=bolt_length);
}

// Helper function to create a nut
module nut() {
    cylinder(d=nut_diameter, h=nut_thickness);
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input Shaft
    translate([0, 0, shaft_length / 2])
        cylinder(d=shaft_diameter, h=shaft_length);

    // Layer 2: Flange Plate 1 + Nuts
    translate([0, 0, shaft_length])
        flange_plate();
    for (pos in bolt_hole_positions) {
        translate([pos[0], pos[1], shaft_length + flange_thickness])
            nut();
    }

    // Layer 3: Spacer Ring 1 + Bolts
    translate([0, 0, shaft_length + flange_thickness])
        spacer_ring();
    for (pos in bolt_hole_positions) {
        translate([pos[0], pos[1], shaft_length + flange_thickness])
            bolt();
    }

    // Layer 4: Flange Plate 2 + Nuts
    translate([0, 0, shaft_length + flange_thickness + spacer_ring_thickness])
        flange_plate();
    for (pos in bolt_hole_positions) {
        translate([pos[0], pos[1], shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness])
            nut();
    }

    // Layer 5: Central Shaft
    translate([0, 0, shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness])
        cylinder(d=central_shaft_diameter, h=central_shaft_length);

    // Layer 6: Flange Plate 3 + Nuts
    translate([0, 0, shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness + central_shaft_length])
        flange_plate();
    for (pos in bolt_hole_positions) {
        translate([pos[0], pos[1], shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness + central_shaft_length + flange_thickness])
            nut();
    }

    // Layer 7: Spacer Ring 2 + Bolts
    translate([0, 0, shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness + central_shaft_length + flange_thickness])
        spacer_ring();
    for (pos in bolt_hole_positions) {
        translate([pos[0], pos[1], shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness + central_shaft_length + flange_thickness])
            bolt();
    }

    // Layer 8: Flange Plate 4 + Nuts
    translate([0, 0, shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness + central_shaft_length + flange_thickness + spacer_ring_thickness])
        flange_plate();
    for (pos in bolt_hole_positions) {
        translate([pos[0], pos[1], shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness + central_shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness])
            nut();
    }

    // Layer 9: Output Shaft
    translate([0, 0, shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness + central_shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness])
        cylinder(d=shaft_diameter, h=shaft_length);
}

// Render the flexible coupling
flexible_coupling();

