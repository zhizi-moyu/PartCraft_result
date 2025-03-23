
// Define parameters for components
module central_cylinder() {
    difference() {
        cylinder(h=30, r=20, $fn=100); // Outer cylinder
        cylinder(h=30, r=10, $fn=100); // Hollow center
    }
}

module input_cylinder() {
    difference() {
        cylinder(h=20, r1=15, r2=10, $fn=100); // Tapered cylinder
        cylinder(h=20, r=5, $fn=100); // Hollow center
    }
}

module output_cylinder() {
    difference() {
        cylinder(h=20, r1=15, r2=10, $fn=100); // Tapered cylinder
        cylinder(h=20, r=5, $fn=100); // Hollow center
    }
}

module spacer_ring() {
    difference() {
        cylinder(h=5, r=20, $fn=100); // Outer ring
        cylinder(h=5, r=15, $fn=100); // Hollow center
    }
}

module flange_plate() {
    difference() {
        cylinder(h=5, r=25, $fn=100); // Outer plate
        cylinder(h=5, r=15, $fn=100); // Hollow center
        for (i = [0:3]) {
            rotate([0, 0, i * 90]) translate([20, 0, 0]) cylinder(h=5, r=2, $fn=100); // Bolt holes
        }
    }
}

module nut() {
    cylinder(h=5, r=3, $fn=6); // Hexagonal nut
}

module bolt() {
    union() {
        cylinder(h=20, r=2, $fn=100); // Bolt shaft
        translate([0, 0, 20]) cylinder(h=5, r=3, $fn=6); // Bolt head
    }
}

// Assemble the coupling
module flexible_coupling() {
    union() {
        // Layer 1: Input cylinder
        translate([0, 0, 100]) input_cylinder();

        // Layer 2: First flange plate with nuts
        translate([0, 0, 80]) flange_plate();
        for (i = [0:3]) {
            rotate([0, 0, i * 90]) translate([20, 0, 80]) nut();
        }

        // Layer 3: First spacer ring with bolts
        translate([0, 0, 75]) spacer_ring();
        for (i = [0:3]) {
            rotate([0, 0, i * 90]) translate([20, 0, 75]) bolt();
        }

        // Layer 4: Second flange plate with nuts
        translate([0, 0, 55]) flange_plate();
        for (i = [0:3]) {
            rotate([0, 0, i * 90]) translate([20, 0, 55]) nut();
        }

        // Layer 5: Central cylinder
        translate([0, 0, 25]) central_cylinder();

        // Layer 6: Third flange plate with nuts
        translate([0, 0, 5]) flange_plate();
        for (i = [0:3]) {
            rotate([0, 0, i * 90]) translate([20, 0, 5]) nut();
        }

        // Layer 7: Second spacer ring with bolts
        translate([0, 0, 0]) spacer_ring();
        for (i = [0:3]) {
            rotate([0, 0, i * 90]) translate([20, 0, 0]) bolt();
        }

        // Layer 8: Fourth flange plate with nuts
        translate([0, 0, -20]) flange_plate();
        for (i = [0:3]) {
            rotate([0, 0, i * 90]) translate([20, 0, -20]) nut();
        }

        // Layer 9: Output cylinder
        translate([0, 0, -40]) output_cylinder();
    }
}

// Render the flexible coupling
flexible_coupling();

