
// Parameters for components
module central_shaft() {
    // Adjusted to remove protrusions and smooth the surface
    difference() {
        cylinder(h = 40, d1 = 22, d2 = 25, $fn = 100); // Slightly larger diameter at one end
        translate([0, 0, 0])
            cylinder(h = 40, d = 10, $fn = 100); // Hollow center
    }
}

module input_shaft() {
    // Adjusted taper and simplified surface
    difference() {
        cylinder(h = 30, d1 = 18, d2 = 16, $fn = 100); // Reduced taper
        translate([0, 0, 0])
            cylinder(h = 30, d = 10, $fn = 100); // Hollow center
    }
}

module output_shaft() {
    // Adjusted taper and simplified surface
    difference() {
        cylinder(h = 30, d1 = 18, d2 = 16, $fn = 100); // Reduced taper
        translate([0, 0, 0])
            cylinder(h = 30, d = 10, $fn = 100); // Hollow center
    }
}

module spacer_ring() {
    // Reduced thickness and removed grooves/ridges
    difference() {
        cylinder(h = 3, d = 20, $fn = 100); // Thinner ring
        translate([0, 0, 0])
            cylinder(h = 3, d = 15, $fn = 100); // Hollow center
    }
}

module flange_plate() {
    // Increased number of holes and ensured even spacing
    difference() {
        cylinder(h = 5, d = 25, $fn = 100); // Outer plate
        translate([0, 0, 0])
            cylinder(h = 5, d = 15, $fn = 100); // Hollow center
        for (i = [0:30:360]) { // Increased number of holes
            rotate([0, 0, i])
                translate([10, 0, 0])
                    cylinder(h = 5, d = 2, $fn = 100); // Bolt holes
        }
    }
}

module nut() {
    // Standardized hexagonal profile and removed extra details
    cylinder(h = 5, d = 5, $fn = 6); // Hexagonal nut
}

module bolt() {
    // Adjusted head shape and removed extra features
    union() {
        cylinder(h = 20, d = 2, $fn = 100); // Bolt shaft
        translate([0, 0, 20])
            cylinder(h = 5, d = 4, $fn = 6); // Adjusted hexagonal head
    }
}

// Assembly
module flexible_coupling() {
    union() {
        translate([0, 0, 0])
            central_shaft();
        translate([0, 0, 40])
            input_shaft();
        translate([0, 0, -30])
            output_shaft();
        translate([0, 0, 35])
            spacer_ring();
        translate([0, 0, -5])
            spacer_ring();
        translate([0, 0, 30])
            flange_plate();
        translate([0, 0, -10])
            flange_plate();
        for (i = [0:30:360]) { // Adjusted for increased number of bolts
            rotate([0, 0, i])
                translate([10, 0, 30])
                    bolt();
            rotate([0, 0, i])
                translate([10, 0, -10])
                    bolt();
        }
        for (i = [0:30:360]) { // Adjusted for increased number of nuts
            rotate([0, 0, i])
                translate([10, 0, 35])
                    nut();
            rotate([0, 0, i])
                translate([10, 0, -5])
                    nut();
        }
    }
}

// Render the model
flexible_coupling();

