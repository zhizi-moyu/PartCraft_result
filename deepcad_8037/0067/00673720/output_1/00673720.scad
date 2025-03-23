// Function to create a tapered ring
module tapered_ring(inner_diameter, outer_diameter, height, taper_height) {
    difference() {
        // Outer cylinder
        cylinder(h=height, r=outer_diameter/2, $fn=100);
        // Inner cylinder
        translate([0, 0, -0.1]) // Slightly lower to ensure clean subtraction
        cylinder(h=height + 0.2, r=inner_diameter/2, $fn=100);
        // Tapered edge
        translate([0, 0, height - taper_height])
        rotate([0, 0, 0])
        cylinder(h=taper_height, r1=outer_diameter/2, r2=outer_diameter/4, $fn=100); // Adjust tapering for sharper edge
    }
}

// Parameters for the tapered ring
inner_diameter = 20; // Inner diameter of the ring
outer_diameter = 28; // Adjusted outer diameter to match original model proportions
height = 4;          // Adjusted height for thinner ring
taper_height = 6;    // Adjusted taper height for sharper edge

// Stack of tapered rings
translate([0, 0, 0]) tapered_ring(inner_diameter, outer_diameter, height, taper_height); // Layer 1
translate([0, 0, height]) tapered_ring(inner_diameter, outer_diameter, height, taper_height); // Layer 2
translate([0, 0, 2 * height]) tapered_ring(inner_diameter, outer_diameter, height, taper_height); // Layer 3
translate([0, 0, 3 * height]) tapered_ring(inner_diameter, outer_diameter, height, taper_height); // Layer 4
translate([0, 0, 4 * height]) tapered_ring(inner_diameter, outer_diameter, height, taper_height); // Layer 5
translate([0, 0, 5 * height]) tapered_ring(inner_diameter, outer_diameter, height, taper_height); // Layer 6
