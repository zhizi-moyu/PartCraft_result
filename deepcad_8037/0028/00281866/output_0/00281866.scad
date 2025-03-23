
// Dimensions for components
module central_block() {
    difference() {
        cube([20, 20, 10], center = true);
        translate([10, 0, 5])
            cube([5, 5, 5], center = true);
    }
}

module side_block() {
    difference() {
        cube([20, 10, 10], center = true);
        translate([10, 0, 5])
            cube([5, 5, 5], center = true);
    }
}

module spacer_block() {
    difference() {
        cube([20, 20, 10], center = true);
        translate([10, 0, 5])
            cube([5, 5, 5], center = true);
    }
}

module connector_block() {
    difference() {
        cube([20, 20, 10], center = true);
        translate([10, 0, 5])
            cube([5, 5, 5], center = true);
    }
}

