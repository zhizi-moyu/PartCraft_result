
// Central Cylinder Parameters
cylinder_diameter = 40; // Diameter of the central cylinder
cylinder_height = 20;   // Height of the central cylinder
hole_diameter = 10;     // Diameter of the central hole

// Central Cylinder Module
module central_cylinder() {
    difference() {
        // Main body of the cylinder
        cylinder(d = cylinder_diameter, h = cylinder_height, center = true);
        // Central hole
        cylinder(d = hole_diameter, h = cylinder_height + 2, center = true);
    }
}

// Render the central cylinder
central_cylinder();

