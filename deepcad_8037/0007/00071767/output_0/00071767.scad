
// Parameters for the cylindrical component
cylinder_outer_diameter = 20; // Outer diameter of the cylinder
cylinder_height = 40;        // Height of the cylinder
cylinder_inner_diameter = 10; // Inner diameter (hollow center)

// Function to create the cylindrical component
module cylindrical_component() {
    difference() {
        // Outer cylinder
        cylinder(d=cylinder_outer_diameter, h=cylinder_height, center=true);
        // Inner hollow cylinder
        cylinder(d=cylinder_inner_diameter, h=cylinder_height + 1, center=true);
    }
}

// Assembly of the model
translate([0, 0, 0]) {
    cylindrical_component();
}

