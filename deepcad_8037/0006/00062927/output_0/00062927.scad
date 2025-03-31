
// Parameters
base_length = 100;   // Length of the Rectangular Base Plate
base_width = 20;     // Width of the Rectangular Base Plate
base_thickness = 2;  // Thickness of the Rectangular Base Plate
hole_diameter = 5;   // Diameter of mounting holes on the base
hole_spacing = 80;   // Distance between the centers of the holes
chamfer = 1;         // Chamfer of edges
peg_height = 10;     // Height of the Hexagonal Peg
peg_radius = 5;      // Circumscribed circle radius for the hexagon

// Main function to combine components
module flexible_coupling() {
    base_plate();
    translate([0, 0, base_thickness]) 
        hexagonal_peg();
}

// Rectangular Base Plate
module base_plate() {
    difference() {
        // Base rectangle with chamfered edges
        minkowski() {
            cube([base_length - 2*chamfer, base_width - 2*chamfer, base_thickness]);
            translate([chamfer, chamfer])
                square(chamfer);
        }
        // Holes on the base plate
        for (x = [-hole_spacing/2, hole_spacing/2]) 
            translate([x, 0, 0])
                cylinder(h = base_thickness + 1, d = hole_diameter, center = true);
    }
}

// Hexagonal Peg
module hexagonal_peg() {
    rotate([0,0,30])
        cylinder(h = peg_height, r = peg_radius, $fn = 6);
}

// Generate the flexible coupling
flexible_coupling();

