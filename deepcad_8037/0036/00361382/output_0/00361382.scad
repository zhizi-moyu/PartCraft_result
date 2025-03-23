
// Base block
module base_block() {
    cube([40, 40, 10], center = false);
}

// Inclined block
module inclined_block() {
    difference() {
        cube([40, 40, 20], center = false);
        translate([0, 0, 0])
            rotate([0, 0, 0])
            linear_extrude(height = 20)
            polygon(points = [[0, 0], [40, 0], [40, 40]]);
    }
}

// Notched block
module notched_block() {
    difference() {
        cube([40, 40, 20], center = false);
        translate([0, 0, 0])
            rotate([0, 0, 0])
            linear_extrude(height = 20)
            polygon(points = [[0, 0], [40, 0], [40, 40]]);
    }
}

// Assembly
module assembly() {
    translate([0,0,0])
    base_block();
    translate([0,0,0])
    inclined_block();
    translate([0,0,0])
    notched_block();
}

