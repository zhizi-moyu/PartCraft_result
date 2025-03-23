
// Parameters for the flat plate
plate_length = 100; // Length of the flat plate
plate_width = 100;  // Width of the flat plate
plate_thickness = 5; // Thickness of the flat plate
hole_diameter = 10; // Diameter of the circular holes
corner_radius = 10; // Radius for rounded edges
hole_spacing = 70;  // Spacing between the corner holes

// Module to create a flat plate with rounded edges and holes
module flat_plate() {
    // Create the base plate with rounded edges
    difference() {
        minkowski() {
            square([plate_length - 2 * corner_radius, plate_width - 2 * corner_radius], center = true);
            circle(corner_radius);
        }
        // Create the holes
        for (x = [-hole_spacing / 2, hole_spacing / 2]) {
            for (y = [-hole_spacing / 2, hole_spacing / 2]) {
                translate([x, y, 0])
                    cylinder(h = plate_thickness + 1, d = hole_diameter, center = true);
            }
        }
        // Center hole
        translate([0, 0, 0])
            cylinder(h = plate_thickness + 1, d = hole_diameter, center = true);
    }
}

// Render the flat plate
flat_plate();

