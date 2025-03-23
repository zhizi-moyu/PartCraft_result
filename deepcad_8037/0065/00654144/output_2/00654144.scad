
// Central Cylinder Parameters
cylinder_diameter = 40; // Diameter of the central cylinder
cylinder_height = 22;   // Increased height of the central cylinder to match the original model
hole_diameter = 6;      // Reduced diameter of the central hole to match the original model
$fn = 100;              // Increased resolution for smoother surface finish

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

