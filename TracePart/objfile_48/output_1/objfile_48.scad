
// Parameters for the model
module input_clamping_cylinder() {
    difference() {
        // Shortened cylindrical shape
        cylinder(h = 15, r = 10, center = true);
        
        // Precision-drilled holes
        translate([0, 0, -7.5]) rotate([90, 0, 0]) cylinder(h = 30, r = 2, center = true);
        translate([5, 0, -7.5]) rotate([90, 0, 0]) cylinder(h = 30, r = 2, center = true);
        
        // Widened and better-defined slotted openings
        translate([-10, -6, -7.5]) cube([20, 12, 15], center = true);
        
        // Deepened grooves for the elastic element
        translate([0, 0, -7.5]) rotate([90, 0, 0]) cylinder(h = 30, r = 9, center = true);
    }
}

module output_clamping_cylinder() {
    difference() {
        // Shortened cylindrical shape
        cylinder(h = 15, r = 10, center = true);
        
        // Precision-drilled holes aligned properly
        translate([0, 0, -7.5]) rotate([90, 0, 0]) cylinder(h = 30, r = 2, center = true);
        translate([5, 0, -7.5]) rotate([90, 0, 0]) cylinder(h = 30, r = 2, center = true);
        
        // Widened and better-defined slotted openings
        translate([-10, -6, -7.5]) cube([20, 12, 15], center = true);
        
        // Deepened grooves for the elastic element
        translate([0, 0, -7.5]) rotate([90, 0, 0]) cylinder(h = 30, r = 9, center = true);
    }
}

module elastic_spacer_ring() {
    difference() {
        // Thinner and more flexible ring
        cylinder(h = 1.5, r = 10, center = true);
        cylinder(h = 1.5, r = 8.5, center = true);
    }
}

module bolt() {
    // Lengthened and more slender bolt
    cylinder(h = 35, r = 1.2, center = true);
}

module threaded_nut() {
    difference() {
        // Slimmed down nut with sharper hexagonal edges
        cylinder(h = 2.5, r = 3, center = true);
        cylinder(h = 2.5, r = 1.5, center = true);
        rotate([0, 0, 0]) translate([-3, -3, -1.25]) cube([6, 6, 2.5], center = true);
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input clamping cylinder
    translate([0, 0, 7.5]) input_clamping_cylinder();
    
    // Layer 2: First elastic spacer ring
    translate([0, 0, 3.75]) elastic_spacer_ring();
    
    // Layer 3: Output clamping cylinder
    translate([0, 0, 0]) output_clamping_cylinder();
    
    // Layer 4: Second elastic spacer ring
    translate([0, 0, -3.75]) elastic_spacer_ring();
    
    // Layer 5: Bolts and nuts
    translate([0, 0, 0]) bolt();
    translate([5, 0, 0]) bolt();
    translate([0, 0, 12.5]) threaded_nut();
    translate([5, 0, 12.5]) threaded_nut();
}

// Render the model
flexible_coupling();

