
// Parameters for the model
module input_clamping_cylinder() {
    difference() {
        // Adjusted cylindrical shape to match original proportions
        cylinder(h = 12, r = 10, center = true);
        
        // Precision-drilled holes
        translate([0, 0, -6]) rotate([90, 0, 0]) cylinder(h = 24, r = 2, center = true);
        translate([5, 0, -6]) rotate([90, 0, 0]) cylinder(h = 24, r = 2, center = true);
        
        // Narrowed and better-defined slotted openings
        translate([-10, -5, -6]) cube([20, 10, 12], center = true);
        
        // Shallower grooves for the elastic element
        translate([0, 0, -6]) rotate([90, 0, 0]) cylinder(h = 24, r = 8.5, center = true);
    }
}

module output_clamping_cylinder() {
    difference() {
        // Adjusted cylindrical shape to match original proportions
        cylinder(h = 12, r = 10, center = true);
        
        // Precision-drilled holes aligned properly
        translate([0, 0, -6]) rotate([90, 0, 0]) cylinder(h = 24, r = 2, center = true);
        translate([5, 0, -6]) rotate([90, 0, 0]) cylinder(h = 24, r = 2, center = true);
        
        // Narrowed and better-defined slotted openings
        translate([-10, -5, -6]) cube([20, 10, 12], center = true);
        
        // Shallower grooves for the elastic element
        translate([0, 0, -6]) rotate([90, 0, 0]) cylinder(h = 24, r = 8.5, center = true);
    }
}

module elastic_spacer_ring() {
    difference() {
        // Thinner and more uniform ring
        cylinder(h = 1, r = 10, center = true);
        cylinder(h = 1, r = 9, center = true);
    }
}

module bolt() {
    // Shortened and more slender bolt
    cylinder(h = 30, r = 1, center = true);
}

module threaded_nut() {
    difference() {
        // Slimmed down nut with sharper hexagonal edges
        cylinder(h = 2, r = 2.5, center = true);
        cylinder(h = 2, r = 1.2, center = true);
        rotate([0, 0, 0]) translate([-2.5, -2.5, -1]) cube([5, 5, 2], center = true);
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input clamping cylinder
    translate([0, 0, 6]) input_clamping_cylinder();
    
    // Layer 2: First elastic spacer ring
    translate([0, 0, 3]) elastic_spacer_ring();
    
    // Layer 3: Output clamping cylinder
    translate([0, 0, 0]) output_clamping_cylinder();
    
    // Layer 4: Second elastic spacer ring
    translate([0, 0, -3]) elastic_spacer_ring();
    
    // Layer 5: Bolts and nuts
    translate([0, 0, 0]) bolt();
    translate([5, 0, 0]) bolt();
    translate([0, 0, 10]) threaded_nut();
    translate([5, 0, 10]) threaded_nut();
}

// Render the model
flexible_coupling();

