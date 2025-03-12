
// Parameters for the components
module central_hub() {
    difference() {
        cylinder(h=18, r=15, $fn=100); // Outer cylinder
        cylinder(h=18, r=10, $fn=100); // Hollow center
        for (i = [0:7]) { // 8 bolt holes
            rotate([0, 0, i * 45])
                translate([12, 0, 9])
                    cylinder(h=18, r=2, $fn=100); // Bolt holes
        }
        // Adjusted external grooves to match the original model
        for (z = [3, 7, 11, 15]) {
            translate([0, 0, z])
                cylinder(h=1, r=14, $fn=100);
        }
    }
}

module input_hub() {
    difference() {
        cylinder(h=20, r=15, $fn=100); // Outer cylinder
        cylinder(h=20, r=12, $fn=100); // Hollow center
        for (i = [0:7]) { // 8 bolt holes
            rotate([0, 0, i * 45])
                translate([12, 0, 10])
                    cylinder(h=20, r=2, $fn=100); // Bolt holes
        }
        // Adjusted groove pattern to match the original model
        for (z = [3, 7, 11, 15]) {
            translate([0, 0, z])
                cylinder(h=1.5, r=14, $fn=100);
        }
    }
}

module output_hub() {
    difference() {
        cylinder(h=18, r=15, $fn=100); // Outer cylinder
        cylinder(h=18, r=12, $fn=100); // Hollow center
        for (i = [0:7]) { // 8 bolt holes
            rotate([0, 0, i * 45])
                translate([12, 0, 9])
                    cylinder(h=18, r=2, $fn=100); // Bolt holes
        }
        // Adjusted groove pattern to match the original model
        for (z = [3, 7, 11, 15]) {
            translate([0, 0, z])
                cylinder(h=1.5, r=14, $fn=100);
        }
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=2, r=15, $fn=100); // Reduced thickness
        cylinder(h=2, r=10, $fn=100); // Hollow center
        for (i = [0:7]) { // 8 bolt holes
            rotate([0, 0, i * 45])
                translate([12, 0, 1])
                    cylinder(h=2, r=2, $fn=100); // Bolt holes
        }
    }
}

module flange_plate() {
    difference() {
        cylinder(h=2.5, r=15, $fn=100); // Adjusted thickness
        cylinder(h=2.5, r=12, $fn=100); // Enlarged central hole
        for (i = [0:7]) { // 8 bolt holes
            rotate([0, 0, i * 45])
                translate([12, 0, 1.25])
                    cylinder(h=2.5, r=2, $fn=100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h=4, r=2.5, $fn=6); // Reduced hexagonal nut size
}

module bolt() {
    union() {
        cylinder(h=22, r=2, $fn=100); // Shortened threaded shaft
        translate([0, 0, 22])
            cylinder(h=4, r=3.5, $fn=6); // Adjusted hexagonal head
    }
}

// Assembly
module assembly() {
    translate([0, 0, 80]) input_hub();
    translate([0, 0, 60]) flange_plate();
    translate([0, 0, 57]) spacer_ring();
    translate([0, 0, 54]) flange_plate();
    translate([0, 0, 30]) central_hub();
    translate([0, 0, 27]) flange_plate();
    translate([0, 0, 24]) spacer_ring();
    translate([0, 0, 21]) flange_plate();
    translate([0, 0, 0]) output_hub();
    
    // Bolts and nuts
    for (i = [0:7]) { // 8 bolts and nuts
        rotate([0, 0, i * 45]) {
            translate([12, 0, 60]) bolt();
            translate([12, 0, 57]) nut();
            translate([12, 0, 27]) nut();
            translate([12, 0, 24]) bolt();
        }
    }
}

// Render the assembly
assembly();

