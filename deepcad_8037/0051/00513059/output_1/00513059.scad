
// Define parameters for components
module central_cylinder() {
    // Smooth central cylinder without grooves or ridges
    difference() {
        cylinder(h=30, r=20, $fn=100); // Outer cylinder
        cylinder(h=30, r=10, $fn=100); // Hollow center
    }
}

module input_cylinder() {
    // Reduced taper for input cylinder
    difference() {
        cylinder(h=20, r1=12, r2=10, $fn=100); // Tapered cylinder with less pronounced taper
        cylinder(h=20, r=5, $fn=100); // Hollow center
    }
}

module output_cylinder() {
    // Adjusted length and smoother taper for output cylinder
    difference() {
        cylinder(h=25, r1=12, r2=10, $fn=100); // Tapered cylinder with smoother taper
        cylinder(h=25, r=5, $fn=100); // Hollow center
    }
}

module spacer_ring() {
    // Reduced thickness for spacer ring
    difference() {
        cylinder(h=3, r=20, $fn=100); // Outer ring
        cylinder(h=3, r=15, $fn=100); // Hollow center
    }
}

module flange_plate() {
    // Additional bolt holes for flange plate
    difference() {
        cylinder(h=5, r=25, $fn=100); // Outer plate
        cylinder(h=5, r=15, $fn=100); // Hollow center
        for (i = [0:5]) { // Increased number of bolt holes
            rotate([0, 0, i * 60]) translate([20, 0, 0]) cylinder(h=5, r=2, $fn=100); // Bolt holes
        }
    }
}

module nut() {
    // Rounded edges for hexagonal nut
    minkowski() {
        cylinder(h=5, r=3, $fn=6); // Hexagonal nut
        sphere(r=0.5); // Rounded edges
    }
}

module bolt() {
    // Reduced length for bolt
    union() {
        cylinder(h=15, r=2, $fn=100); // Bolt shaft
        translate([0, 0, 15]) cylinder(h=5, r=3, $fn=6); // Bolt head
    }
}

// Assemble the coupling
module flexible_coupling() {
    union() {
        // Layer 1: Input cylinder
        translate([0, 0, 100]) input_cylinder();

        // Layer 2: First flange plate with nuts
        translate([0, 0, 80]) flange_plate();
        for (i = [0:5]) {
            rotate([0, 0, i * 60]) translate([20, 0, 80]) nut();
        }

        // Layer 3: First spacer ring with bolts
        translate([0, 0, 75]) spacer_ring();
        for (i = [0:5]) {
            rotate([0, 0, i * 60]) translate([20, 0, 75]) bolt();
        }

        // Layer 4: Second flange plate with nuts
        translate([0, 0, 55]) flange_plate();
        for (i = [0:5]) {
            rotate([0, 0, i * 60]) translate([20, 0, 55]) nut();
        }

        // Layer 5: Central cylinder
        translate([0, 0, 25]) central_cylinder();

        // Layer 6: Third flange plate with nuts
        translate([0, 0, 5]) flange_plate();
        for (i = [0:5]) {
            rotate([0, 0, i * 60]) translate([20, 0, 5]) nut();
        }

        // Layer 7: Second spacer ring with bolts
        translate([0, 0, 0]) spacer_ring();
        for (i = [0:5]) {
            rotate([0, 0, i * 60]) translate([20, 0, 0]) bolt();
        }

        // Layer 8: Fourth flange plate with nuts
        translate([0, 0, -20]) flange_plate();
        for (i = [0:5]) {
            rotate([0, 0, i * 60]) translate([20, 0, -20]) nut();
        }

        // Layer 9: Output cylinder
        translate([0, 0, -40]) output_cylinder();
    }
}

// Render the flexible coupling
flexible_coupling();

