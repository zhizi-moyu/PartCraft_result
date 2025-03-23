// Parameters for components
module central_shaft() {
    cylinder(h=60, r=8, $fn=100); // Adjusted central shaft dimensions
}

module input_shaft() {
    difference() {
        cylinder(h=25, r=8, $fn=100); // Adjusted input shaft dimensions
        translate([0, 0, -1]) cylinder(h=27, r=4, $fn=100); // Reduced hollow center
    }
}

module output_shaft() {
    difference() {
        cylinder(h=40, r=8, $fn=100); // Adjusted output shaft dimensions
        translate([0, 0, -1]) cylinder(h=42, r=4, $fn=100); // Reduced hollow center
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=3, r=12, $fn=100); // Adjusted outer ring dimensions
        translate([0, 0, -1]) cylinder(h=5, r=8, $fn=100); // Adjusted inner hollow
    }
}

module flange_plate() {
    difference() {
        cylinder(h=3, r=18, $fn=100); // Adjusted flange plate thickness
        translate([0, 0, -1]) cylinder(h=5, r=8, $fn=100); // Adjusted inner hollow
        for (angle = [0:60:300]) { // Increased number of bolt holes
            translate([14*cos(angle), 14*sin(angle), -1])
                cylinder(h=5, r=1.5, $fn=100); // Adjusted bolt hole size
        }
    }
}

module nut() {
    cylinder(h=3, r=2.5, $fn=6); // Adjusted nut size and shape
}

module bolt() {
    union() {
        cylinder(h=25, r=1.5, $fn=100); // Adjusted bolt shaft dimensions
        translate([0, 0, 25]) cylinder(h=3, r=2.5, $fn=6); // Adjusted bolt head size
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input shaft
    translate([0, 0, 90]) input_shaft();

    // Layer 2: First flange plate and nuts
    translate([0, 0, 87]) flange_plate();
    for (angle = [0:60:300]) {
        translate([14*cos(angle), 14*sin(angle), 87]) nut();
    }

    // Layer 3: First spacer ring and bolts
    translate([0, 0, 84]) spacer_ring();
    for (angle = [0:60:300]) {
        translate([14*cos(angle), 14*sin(angle), 84]) bolt();
    }

    // Layer 4: Central shaft
    translate([0, 0, 50]) central_shaft();

    // Layer 5: Second spacer ring and bolts
    translate([0, 0, 20]) spacer_ring();
    for (angle = [0:60:300]) {
        translate([14*cos(angle), 14*sin(angle), 20]) bolt();
    }

    // Layer 6: Second flange plate and nuts
    translate([0, 0, 17]) flange_plate();
    for (angle = [0:60:300]) {
        translate([14*cos(angle), 14*sin(angle), 17]) nut();
    }

    // Layer 7: Output shaft
    translate([0, 0, 0]) output_shaft();
}

// Render the flexible coupling
flexible_coupling();
