
// Parameters for the link plate
plate_length = 40; // Length of the plate
plate_width = 10;  // Width of the plate
plate_thickness = 1.2; // Thickness of the plate (reduced to match original model)
hole_diameter = 5; // Diameter of the holes
hole_spacing = 30; // Distance between the centers of the holes
curvature = 4; // Amount of curvature along the length (increased to match original model)

// Function to create a single link plate
module link_plate() {
    difference() {
        // Create the curved plate
        linear_extrude(height = plate_thickness) {
            offset(r = curvature) {
                square([plate_length, plate_width], center = true);
            }
        }
        // Create the holes
        translate([-hole_spacing / 2, 0, plate_thickness / 2])
            cylinder(r = hole_diameter / 2, h = plate_thickness, center = true);
        translate([hole_spacing / 2, 0, plate_thickness / 2])
            cylinder(r = hole_diameter / 2, h = plate_thickness, center = true);
    }
}

// Assemble the six link plates in a symmetrical arrangement
module flexible_coupling() {
    for (i = [0:5]) {
        rotate([0, 0, i * 60]) // Rotate each plate by 60 degrees
            translate([0, 0, 0]) // Keep all plates in the same vertical position
                link_plate();
    }
}

// Render the flexible coupling
flexible_coupling();

