
// Parameters for the shaft
module shaft() {
    difference() {
        union() {
            // Main cylindrical sections
            translate([0, 0, -50]) cylinder(h = 20, r = 5, $fn = 100); // End section 1
            translate([0, 0, -30]) cylinder(h = 40, r = 7, $fn = 100); // Central section
            translate([0, 0, 10]) cylinder(h = 20, r = 5, $fn = 100); // End section 2

            // Grooves
            translate([0, 0, -45]) cylinder(h = 5, r = 4.5, $fn = 100); // Groove 1
            translate([0, 0, -35]) cylinder(h = 5, r = 4.5, $fn = 100); // Groove 2
            translate([0, 0, 5]) cylinder(h = 5, r = 4.5, $fn = 100); // Groove 3
            translate([0, 0, 15]) cylinder(h = 5, r = 4.5, $fn = 100); // Groove 4

            // Keyways
            translate([-1, -3, -50]) cube([2, 6, 20]); // Keyway 1
            translate([-1, -3, 10]) cube([2, 6, 20]); // Keyway 2

            // Holes for fasteners
            translate([0, 0, -48]) rotate([90, 0, 0]) cylinder(h = 10, r = 1, $fn = 100); // Hole 1
            translate([0, 0, 12]) rotate([90, 0, 0]) cylinder(h = 10, r = 1, $fn = 100); // Hole 2
        }
    }
}

// Render the shaft
shaft();

