
module bracket() {
    difference() {
        // Main L-shaped bracket
        union() {
            // Vertical arm
            translate([0, 0, 0])
            cube([5, 50, 5], center = false);
            
            // Horizontal arm
            translate([0, -5, 0])
            cube([30, 5, 5], center = false);
        }
        
        // Circular holes
        translate([2.5, 10, 2.5])
        cylinder(r=2.5,h=5)
    }
}

