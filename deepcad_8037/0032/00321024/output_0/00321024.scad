
// Base block
module base_block() {
    difference() {
        cube([40, 40, 20], center = true);
        translate([-10, -10, -10])
            cube([20, 20, 20], center = true);
    }
}

// L-shaped connector
module l_shaped_connector() {
    difference() {
        union() {
            cube([40, 10, 20], center = true);
            translate([0, 0, 10])
                cube([10, 40, 20], center = true);
        }
        translate([-10, -10, -10])
            cube([20, 20, 20], center = true);
    }
}

// Inner triangular support
module inner_triangular_support() {
    difference() {
        cube([40, 40, 20], center = true);
        translate([-10, -10, -10])
            cube([20, 20, 20], center = true);
    }
}

// Flat rectangular plate
module flat_rectangular_plate() {
    cube([40, 40, 20], center = true);
}

// Small rectangular protrusion
module small_rectangular_protrusion() {
    cube([40, 40, 20], center = true);
}

