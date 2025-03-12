
// Parameters for the shaft
module shaft() {
    difference() {
        union() {
            // Main cylindrical sections with stepped diameters
            translate([0, 0, -60]) cylinder(h = 12, r = 5, $fn = 100); // End section 1
            translate([0, 0, -48]) cylinder(h = 18, r = 6, $fn = 100); // Step 1
            translate([0, 0, -30]) cylinder(h = 35, r = 9, $fn = 100); // Central thick section
            translate([0, 0, 5]) cylinder(h = 30, r = 8, $fn = 100); // Step 2
            translate([0, 0, 35]) cylinder(h = 18, r = 6, $fn = 100); // Step 3
            translate([0, 0, 53]) cylinder(h = 12, r = 5, $fn = 100); // End section 2

            // Additional grooves
            translate([0, 0, -55]) cylinder(h = 3, r = 4.5, $fn = 100); // Groove 1
            translate([0, 0, -42]) cylinder(h = 3, r = 4.5, $fn = 100); // Groove 2
            translate([0, 0, -15]) cylinder(h = 3, r = 7, $fn = 100); // Groove 3
            translate([0, 0, 5]) cylinder(h = 3, r = 7, $fn = 100); // Groove 4
            translate([0, 0, 25]) cylinder(h = 3, r = 7, $fn = 100); // Groove 5
            translate([0, 0, 45]) cylinder(h = 3, r = 4.5, $fn = 100); // Groove 6
            translate([0, 0, 55]) cylinder(h = 3, r = 4.5, $fn = 100); // Groove 7

            // Additional keyways
            translate([-1, -3, -60]) cube([2, 6, 18]); // Keyway 1
            translate([-1, -3, -10]) cube([2, 6, 15]); // Keyway 2
            translate([-1, -3, 30]) cube([2, 6, 15]); // Keyway 3
            translate([-1, -3, 45]) cube([2, 6, 15]); // Keyway 4

            // Additional holes for fasteners
            translate([0, 0, -57]) rotate([90, 0, 0]) cylinder(h = 10, r = 1.5, $fn = 100); // Hole 1
            translate([0, 0, -12]) rotate([90, 0, 0]) cylinder(h = 10, r = 1.5, $fn = 100); // Hole 2
            translate([0, 0, 28]) rotate([90, 0, 0]) cylinder(h = 10, r = 1.5, $fn = 100); // Hole 3
            translate([0, 0, 50]) rotate([90, 0, 0]) cylinder(h = 10, r = 1.5, $fn = 100); // Hole 4
        }
    }
}

// Render the shaft
shaft();

