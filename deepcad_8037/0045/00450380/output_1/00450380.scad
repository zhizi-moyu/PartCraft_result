
// Parameters
outer_diameter = 35;  // Uniform outer diameter to reduce tapering
height = 20;  // Height of the cylinder
inner_diameter = 15;  // Diameter of the hollow section

// Module to create the cylindrical hollow object
module cylindrical_hollow_cylinder() {
    difference() {
        // Create a cylindrical shape
        cylinder(h=height, d=outer_diameter, center=false);
        
        // Create the inner hollow section
        translate([0, 0, -1]) // Slightly lower to ensure proper subtraction
        cylinder(h=height+2, d=inner_diameter, center=false);
    }
}

// Call the module to render the object
cylindrical_hollow_cylinder();

