
// Parameters for the flange plate
flange_plate_size = 50; // Length and width of the square plate
flange_plate_thickness = 5; // Thickness of the plate
hole_diameter = 5; // Diameter of the bolt holes
hole_spacing = 30; // Distance between the centers of the holes

// Function to create a flange plate
module flange_plate() {
    difference() {
        // Base square plate
        cube([flange_plate_size, flange_plate_size, flange_plate_thickness], center = true);
        
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

