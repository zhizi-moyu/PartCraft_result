// Parameters for the spacer_ring
module spacer_ring() {
    difference() {
        // Outer cylinder with reduced thickness
        cylinder(h = 2, r = 20, $fn = 100); // Adjusted height to match flatness
        // Inner hollow
        translate([0, 0, -1]) cylinder(h = 3, r = 10, $fn = 100); // Adjusted height to match flatness
    }
}

// Parameters for the flange_plate
module flange_plate() {
    difference() {
        // Outer cylinder for flange plate
        cylinder(h = 2, r = 22, $fn = 100); // Adjusted edge profile for smoother appearance
        // Inner hollow
        translate([0, 0, -0.5]) cylinder(h = 2.5, r = 10, $fn = 100); // Adjusted edge profile for smoother appearance
    }
}

// Parameters for the central_cylinder
module central_cylinder() {
    cylinder(h = 10, r = 4.5, $fn = 100); // Reduced diameter to match the original model
}

// Parameters for the input_cylinder
module input_cylinder() {
    cylinder(h = 7, r = 6, $fn = 100); // Shortened length to match the original model
}

// Parameters for the output_cylinder
module output_cylinder() {
    difference() {
        cylinder(h = 8, r = 6, $fn = 100); // Outer cylinder
        translate([0, 0, 2]) cylinder(h = 6, r = 4, $fn = 100); // Adjusted hollow center profile
    }
}

// Parameters for the nut
module nut() {
    cylinder(h = 3, r = 4, $fn = 6); // Refined hexagonal profile to match the original model
}

// Parameters for the bolt
module bolt() {
    cylinder(h = 12, r = 2, $fn = 6); // Extended threaded end to match the original model
}

// Assemble the model
module assembly() {
    // Layer 1: Spacer Ring
    spacer_ring();
    // Layer 2: Flange Plate
    translate([0, 0, 2]) flange_plate();
    // Layer 3: Central Cylinder
    translate([0, 0, 4]) central_cylinder();
    // Layer 4: Input Cylinder
    translate([0, 0, 14]) input_cylinder();
    // Layer 5: Output Cylinder
    translate([0, 0, 21]) output_cylinder();
    // Layer 6: Nut
    translate([0, 0, 29]) nut();
    // Layer 7: Bolt
    translate([0, 0, 32]) bolt();
}

// Render the assembly
assembly();
