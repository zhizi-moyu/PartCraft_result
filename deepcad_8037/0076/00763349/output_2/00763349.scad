
// Parameters for the flange plate
flange_plate_size = 50; // Length and width of the square plate
flange_plate_thickness = 2; // Adjusted thickness of the plate to match the original model
hole_diameter = 5; // Diameter of the bolt holes
hole_spacing = 30; // Distance between the centers of the holes
edge_radius = 3; // Increased radius for rounding the edges of the flange plate to match the original design

// Function to create a flange plate
module flange_plate() {
    difference() {
        // Base square plate with rounded edges
        minkowski() {
            cube([flange_plate_size - edge_radius * 2, flange_plate_size - edge_radius * 2, flange_plate_thickness], center = true);
            sphere(r = edge_radius);
        }
        
        // Bolt holes
        for (x = [-hole_spacing/2, hole_spacing/2]) {
            for (y = [-hole_spacing/2, hole_spacing/2]) {
                translate([x, y, 0])
                    cylinder(r = hole_diameter/2, h = flange_plate_thickness + 1, center = true);
            }
        }
    }
}

// Render the flange plate
flange_plate();

