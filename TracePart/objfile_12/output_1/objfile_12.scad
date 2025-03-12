
// Parameters for the components
module central_hub() {
    difference() {
        cylinder(h=18, r=15, $fn=100); // Shortened outer cylinder
        cylinder(h=18, r=10, $fn=100); // Hollow center
        for (i = [0:7]) { // Adjusted to 8 bolt holes
            rotate([0, 0, i * 45])
                translate([12, 0, 9])
                    cylinder(h=18, r=2, $fn=100); // Bolt holes
        }
        // Added grooves for better resemblance
        for (z = [2, 6, 10, 14]) {
            translate([0, 0, z])
                cylinder(h=1, r=14, $fn=100);
        }
    }
}

module input_hub() {
    difference() {
        cylinder(h=20, r=15, $fn=100); // Outer cylinder
        cylinder(h=20, r=12, $fn=100); // Widened hollow center
        for (i = [0:7]) { // Adjusted to 8 bolt holes
            rotate([0, 0, i * 45])
                translate([12, 0, 10])
                    cylinder(h=20, r=2, $fn=100); // Bolt holes
        }
        // Deepened grooves
        for (z = [2, 6, 10, 14]) {
            translate([0, 0, z])
                cylinder(h=1, r=14, $fn=100);
        }
    }
}

module output_hub() {
    difference() {
        cylinder(h=18, r=15, $fn=100); // Reduced flange thickness
        cylinder(h=18, r=12, $fn=100); // Widened hollow center
        for (i = [0:7]) { // Adjusted to 8 bolt holes
            rotate([0, 0, i * 45])
                translate([12, 0, 9])
                    cylinder(h=18, r=2, $fn=100); // Bolt holes
        }
        // Deepened grooves
        for (z = [2, 6, 10, 14]) {
            translate([0, 0, z])
                cylinder(h=1, r=14, $fn=100);
        }
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=3, r=15, $fn=100); // Reduced thickness
        cylinder(h=3, r=10, $fn=100); // Hollow center
        for (i = [0:7]) { // Adjusted to 8 bolt holes
            rotate([0, 0, i * 45])
                translate([12, 0, 1.5])
                    cylinder(h=3, r=2, $fn=100); // Bolt holes
        }
    }
}

module flange_plate() {
    difference() {
        cylinder(h=3, r=15, $fn=100); // Reduced thickness
        cylinder(h=3, r=12, $fn=100); // Enlarged central hole
        for (i = [0:7]) { // Adjusted to 8 bolt holes
            rotate([0, 0, i * 45])
                translate([12, 0, 1.5])
                    cylinder(h=3, r=2, $fn=100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h=5, r=3, $fn=6); // Sharpened hexagonal nut
}

module bolt() {
    union() {
        cylinder(h=25, r=2, $fn=100); // Lengthened threaded shaft
        translate([0, 0, 25])
            cylinder(h=5, r=4, $fn=6); // Enlarged hexagonal head
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
    for (i = [0:7]) { // Adjusted to 8 bolts and nuts
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

