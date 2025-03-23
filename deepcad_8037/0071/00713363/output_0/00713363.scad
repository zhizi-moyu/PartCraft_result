
// Parameters for the flange plate
plate_length = 50;  // Length of the plate
plate_width = 50;   // Width of the plate
plate_thickness = 5; // Thickness of the plate
hole_diameter = 10; // Diameter of the holes
hole_spacing = 30;  // Distance between the centers of the two holes

// Function to create a single flange plate
module flange_plate() {
    difference() {
        // Base plate
        cube([plate_length, plate_width, plate_thickness], center = true);
        
        // Holes
        translate([-hole_spacing / 2, 0, 0])
            cylinder(h = plate_thickness + 1, d = hole_diameter, center = true);
        translate([hole_spacing / 2, 0, 0])
            cylinder(h = plate_thickness + 1, d = hole_diameter, center = true);
    }
}

// Assembly of the flange plates
module assembly() {
    // Layer 1: Top flange plate
    translate([0, 0, plate_thickness * 1.5])
        flange_plate();
    
    // Layer 2: Second flange plate
    translate([0, 0, plate_thickness * 0.5])
        flange_plate();
    
    // Layer 3: Third flange plate
    translate([0, 0, -plate_thickness * 0.5])
        flange_plate();
    
    // Layer 4: Bottom flange plate
    translate([0, 0, -plate_thickness * 1.5])
        flange_plate();
}

// Render the assembly
assembly();

