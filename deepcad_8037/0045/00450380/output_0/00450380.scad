
// Parameters
outer_diameter_top = 30;  // Top diameter of the tapered cylinder
outer_diameter_bottom = 35; // Bottom diameter of the tapered cylinder
height = 20;  // Height of the cylinder
inner_diameter = 15;  // Diameter of the hollow section

// Module to create the angled hollow cylinder
module angled_hollow_cylinder() {
    difference() {
        // Create a tapered cylinder using linear_extrude
        linear_extrude(height=height, scale=outer_diameter_top/outer_diameter_bottom)
        circle(d=outer_diameter_bottom);
        
        // Create the inner hollow section
        translate([0, 0, -1]) // Slightly lower to ensure proper subtraction
        cylinder(h=height+2, d=inner_diameter, center=false);
    }
}

// Call the module to render the object
angled_hollow_cylinder();

