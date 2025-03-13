
// Parameters
module cylinder_with_hole(d_outer, d_inner, h) {
    difference() {
        cylinder(d=d_outer, h=h);
        translate([0, 0, -1]) cylinder(d=d_inner, h=h + 2);
    }
}

module bolt(d, h) {
    union() {
        cylinder(d=d, h=h);
        translate([0, 0, h]) cylinder(d=d * 0.8, h=h * 0.2);
    }
}

// Main coupling assembly
module flexible_coupling() {
    // Left flange
    translate([0, 0, -10]) cylinder_with_hole(40, 20, 10);

    // Right flange
    translate([0, 0, 10]) cylinder_with_hole(40, 20, 10);
}

// Call flexible_coupling()

