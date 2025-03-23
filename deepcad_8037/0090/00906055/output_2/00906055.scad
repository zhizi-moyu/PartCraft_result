
// Parameters for flange plate
plate_thickness = 1.5; // Adjusted thickness to match the original model
outer_diameter = 50; // Outer diameter of the flange plate
inner_diameter = 30; // Inner diameter of the central hole
bolt_hole_diameter = 5; // Diameter of the bolt holes
bolt_hole_count = 8; // Adjusted number of bolt holes to match the original model
bolt_hole_radius = 20; // Radius of the circle on which bolt holes are positioned

module flange_plate() {
    difference() {
        // Create the main plate
        cylinder(h = plate_thickness, d = outer_diameter, center = true);
        
        // Create the central hole
        cylinder(h = plate_thickness + 1, d = inner_diameter, center = true);
        
        // Create the bolt holes
        for (i = [0:bolt_hole_count-1]) {
            rotate([0, 0, i * 360 / bolt_hole_count])
                translate([bolt_hole_radius, 0, 0])
                cylinder(h = plate_thickness + 1, d = bolt_hole_diameter, center = true);
        }
    }
}

// Parameters for spacer ring
spacer_ring_thickness = 0.8; // Reduced thickness to match the flatter profile of the original model
spacer_ring_outer_diameter = 50; // Outer diameter of the spacer ring
spacer_ring_inner_diameter = 30; // Inner diameter of the spacer ring

module spacer_ring() {
    difference() {
        // Create the main ring
        cylinder(h = spacer_ring_thickness, d = spacer_ring_outer_diameter, center = true);
        
        // Create the central hole
        cylinder(h = spacer_ring_thickness + 1, d = spacer_ring_inner_diameter, center = true);
    }
}

// Render the flange plate and spacer ring
flange_plate();
translate([0, 0, plate_thickness + 0.5]) spacer_ring();

