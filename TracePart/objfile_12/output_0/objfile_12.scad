
// Parameters for the components
module central_hub() {
    difference() {
        cylinder(h=20, r=15, $fn=100); // Outer cylinder
        cylinder(h=20, r=10, $fn=100); // Hollow center
        for (i = [0:5]) {
            rotate([0, 0, i * 60])
                translate([12, 0, 10])
                    cylinder(h=20, r=2, $fn=100); // Bolt holes
        }
    }
}

module input_hub() {
    difference() {
        cylinder(h=20, r=15, $fn=100); // Outer cylinder
        cylinder(h=20, r=10, $fn=100); // Hollow center
        for (i = [0:5]) {
            rotate([0, 0, i * 60])
                translate([12, 0, 10])
                    cylinder(h=20, r=2, $fn=100); // Bolt holes
        }
    }
}

module output_hub() {
    difference() {
        cylinder(h=20, r=15, $fn=100); // Outer cylinder
        cylinder(h=20, r=10, $fn=100); // Hollow center
        for (i = [0:5]) {
            rotate([0, 0, i * 60])
                translate([12, 0, 10])
                    cylinder(h=20, r=2, $fn=100); // Bolt holes
        }
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=5, r=15, $fn=100); // Outer ring
        cylinder(h=5, r=10, $fn=100); // Hollow center
        for (i = [0:5]) {
            rotate([0, 0, i * 60])
                translate([12, 0, 2.5])
                    cylinder(h=5, r=2, $fn=100); // Bolt holes
        }
    }
}

module flange_plate() {
    difference() {
        cylinder(h=5, r=15, $fn=100); // Outer plate
        cylinder(h=5, r=10, $fn=100); // Hollow center
        for (i = [0:5]) {
            rotate([0, 0, i * 60])
                translate([12, 0, 2.5])
                    cylinder(h=5, r=2, $fn=100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h=5, r=3, $fn=6); // Hexagonal nut
}

module bolt() {
    union() {
        cylinder(h=20, r=2, $fn=100); // Threaded shaft
        translate([0, 0, 20])
            cylinder(h=5, r=3, $fn=6); // Hexagonal head
    }
}

// Assembly
module assembly() {
    translate([0, 0, 80]) input_hub();
    translate([0, 0, 60]) flange_plate();
    translate([0, 0, 55]) spacer_ring();
    translate([0, 0, 50]) flange_plate();
    translate([0, 0, 30]) central_hub();
    translate([0, 0, 25]) flange_plate();
    translate([0, 0, 20]) spacer_ring();
    translate([0, 0, 15]) flange_plate();
    translate([0, 0, 0]) output_hub();
    
    // Bolts and nuts
    for (i = [0:5]) {
        rotate([0, 0, i * 60]) {
            translate([12, 0, 60]) bolt();
            translate([12, 0, 55]) nut();
            translate([12, 0, 25]) nut();
            translate([12, 0, 20]) bolt();
        }
    }
}

// Render the assembly
assembly();

