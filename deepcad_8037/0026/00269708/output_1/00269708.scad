// Parameters for the spacer_ring
module spacer_ring() {
    difference() {
        // Outer cylinder with reduced thickness
        cylinder(h = 3, r = 20, $fn = 100); // Adjusted height to match flatness
        // Inner hollow
        translate([0, 0, -1]) cylinder(h = 5, r = 10, $fn = 100); // Adjusted height to match flatness
    }
}

// Parameters for the flange_plate
module flange_plate() {
    difference() {
        // Outer cylinder for flange plate
        cylinder(h = 2, r = 22, $fn = 100); // Adjusted edge profile for smoother appearance
        // Inner hollow
        translate([0, 0, -1]) cylinder(h = 3, r = 10, $fn = 100); // Adjusted edge profile for smoother appearance
    }
}

// Parameters for the central_cylinder
module central_cylinder() {
    cylinder(h = 10, r = 5, $fn = 100); // Ensure it matches the original model
}

// Parameters for the input_cylinder
module input_cylinder() {
    cylinder(h = 8, r = 6, $fn = 100); // Ensure it matches the original model
}

// Parameters for the output_cylinder
module output_cylinder() {
    cylinder(h = 8, r = 6, $fn = 100); // Ensure it matches the original model
}

// Parameters for the nut
module nut() {
    cylinder(h = 3, r = 4, $fn = 6); // Ensure it matches the original model
}

// Parameters for the bolt
module bolt() {
    cylinder(h = 10, r = 2, $fn = 6); // Ensure it matches the original model
}

// Assemble the model
module assembly() {
    // Layer 1: Spacer Ring
    spacer_ring();
    // Layer 2: Flange Plate
    translate([0, 0, 3]) flange_plate();
    // Layer 3: Central Cylinder
    translate([0, 0, 5]) central_cylinder();
    // Layer 4: Input Cylinder
    translate([0, 0, 15]) input_cylinder();
    // Layer 5: Output Cylinder
    translate([0, 0, 23]) output_cylinder();
    // Layer 6: Nut
    translate([0, 0, 31]) nut();
    // Layer 7: Bolt
    translate([0, 0, 34]) bolt();
}

// Render the assembly
assembly();
