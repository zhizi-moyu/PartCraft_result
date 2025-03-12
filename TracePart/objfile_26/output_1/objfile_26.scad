
// Parameters for the shaft
module shaft() {
    difference() {
        union() {
            // Main cylindrical sections with stepped diameters
            translate([0, 0, -55]) cylinder(h = 10, r = 5, $fn = 100); // End section 1
            translate([0, 0, -45]) cylinder(h = 15, r = 6, $fn = 100); // Step 1
            translate([0, 0, -30]) cylinder(h = 30, r = 8, $fn = 100); // Central thick section
            translate([0, 0, 0]) cylinder(h = 30, r = 7, $fn = 100); // Step 2
            translate([0, 0, 30]) cylinder(h = 15, r = 6, $fn = 100); // Step 3
            translate([0, 0, 45]) cylinder(h = 10, r = 5, $fn = 100); // End section 2

            // Grooves
            translate([0, 0, -50]) cylinder(h = 3, r = 4.5, $fn = 100); // Groove 1
            translate([0, 0, -40]) cylinder(h = 3, r = 4.5, $fn = 100); // Groove 2
            translate([0, 0, -10]) cylinder(h = 3, r = 6.5, $fn = 100); // Groove 3
            translate([0, 0, 10]) cylinder(h = 3, r = 6.5, $fn = 100); // Groove 4
            translate([0, 0, 40]) cylinder(h = 3, r = 4.5, $fn = 100); // Groove 5
            translate([0, 0, 50]) cylinder(h = 3, r = 4.5, $fn = 100); // Groove 6

            // Keyways
            translate([-1, -3, -55]) cube([2, 6, 15]); // Keyway 1
            translate([-1, -3, 40]) cube([2, 6, 15]); // Keyway 2

            // Holes for fasteners
            translate([0, 0, -52]) rotate([90, 0, 0]) cylinder(h = 10, r = 1, $fn = 100); // Hole 1
            translate([0, 0, 42]) rotate([90, 0, 0]) cylinder(h = 10, r = 1, $fn = 100); // Hole 2
        }
    }
}

// Render the shaft
shaft();

