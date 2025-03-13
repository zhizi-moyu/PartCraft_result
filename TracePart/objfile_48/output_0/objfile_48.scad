
// Parameters for the model
module input_clamping_cylinder() {
    difference() {
        cylinder(h = 20, r = 10, center = true);
        // Precision-drilled holes
        translate([0, 0, -10]) rotate([90, 0, 0]) cylinder(h = 40, r = 2, center = true);
        translate([5, 0, -10]) rotate([90, 0, 0]) cylinder(h = 40, r = 2, center = true);
        // Slotted openings
        translate([-10, -5, -10]) cube([20, 10, 20], center = true);
    }
}

module output_clamping_cylinder() {
    difference() {
        cylinder(h = 20, r = 10, center = true);
        // Precision-drilled holes
        translate([0, 0, -10]) rotate([90, 0, 0]) cylinder(h = 40, r = 2, center = true);
        translate([5, 0, -10]) rotate([90, 0, 0]) cylinder(h = 40, r = 2, center = true);
        // Slotted openings
        translate([-10, -5, -10]) cube([20, 10, 20], center = true);
    }
}

module elastic_spacer_ring() {
    difference() {
        cylinder(h = 2, r = 10, center = true);
        cylinder(h = 2, r = 8, center = true);
    }
}

module bolt() {
    cylinder(h = 30, r = 1.5, center = true);
}

module threaded_nut() {
    difference() {
        cylinder(h = 3, r = 3, center = true);
        cylinder(h = 3, r = 1.5, center = true);
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input clamping cylinder
    translate([0, 0, 10]) input_clamping_cylinder();
    
    // Layer 2: First elastic spacer ring
    translate([0, 0, 5]) elastic_spacer_ring();
    
    // Layer 3: Output clamping cylinder
    translate([0, 0, 0]) output_clamping_cylinder();
    
    // Layer 4: Second elastic spacer ring
    translate([0, 0, -5]) elastic_spacer_ring();
    
    // Layer 5: Bolts and nuts
    translate([0, 0, 0]) bolt();
    translate([5, 0, 0]) bolt();
    translate([0, 0, 15]) threaded_nut();
    translate([5, 0, 15]) threaded_nut();
}

// Render the model
flexible_coupling();

