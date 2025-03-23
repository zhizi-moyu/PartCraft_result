
// Define the geometric part
module geometric_part() {
    difference() {
        // Base shape: a trapezoidal prism
        hull() {
            translate([0, 0, 0]) cube([10, 5, 2], center = true);
            translate([5, 0, 0]) cube([10, 5, 2], center = true);
        }
    }
}

// Render the part
geometric_part();

