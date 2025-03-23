
// Parameters
plate_size = 50; // Length of the square plate (in mm)
plate_thickness = 4; // Adjusted thickness of the plate (in mm) to match the original model
hole_diameter = 40; // Diameter of the central circular hole (in mm)
hole_edge_smoothness = 3; // Increased radius for smoothing the edges of the hole (in mm) to make it more uniform

// Main module
module square_plate_with_hole() {
    // Create the square plate
    difference() {
        cube([plate_size, plate_size, plate_thickness], center=true); // Square plate
        
        // Create a smoothed circular hole
        translate([0, 0, -hole_edge_smoothness]) {
            cylinder(d=hole_diameter, h=plate_thickness + 2 * hole_edge_smoothness, center=true, $fn=100); // Smoothed central circular hole
        }
    }
}

// Render the model
square_plate_with_hole();

