
// Parameters
outer_diameter = 30;  // Outer diameter of the hub
height = 18;          // Adjusted height to better match the original model
inner_diameter_top = 10;  // Inner hole diameter at the top
inner_diameter_bottom = 13; // Adjusted inner hole diameter at the bottom for a less pronounced conical shape

// Module to create the cylindrical hub with a conical hole
module cylindrical_hub() {
    difference() {
        // Main cylindrical body
        cylinder(h=height, d=outer_diameter, center=true);
        
        // Conical inner hole
        translate([0, 0, -height/2])
        linear_extrude(height=height, scale=inner_diameter_bottom/inner_diameter_top)
        circle(d=inner_diameter_top);
    }
}

// Render the cylindrical hub
cylindrical_hub();

