
// Parameters
plate_length = 100; // Length of the base plate
plate_width = 60;   // Width of the base plate
plate_thickness = 4; // Thickness of the base plate (reduced to match original model)
hole_diameter = 6;  // Diameter of the circular holes
hole_offset = 10;   // Distance of the holes from the edges
groove_width = 20;  // Width of the central groove
groove_depth = 2;   // Depth of the central groove
bolt_diameter = 5;  // Diameter of the bolt
bolt_length = 18;   // Length of the bolt (shortened to match original model)
nut_size = 7;       // Width across flats of the nut (reduced to match original model)
nut_thickness = 4;  // Thickness of the nut

// Base plate module
module base_plate() {
    difference() {
        // Main plate
        cube([plate_length, plate_width, plate_thickness], center = true);
        
        // Circular holes
        for (x = [-plate_length/2 + hole_offset, plate_length/2 - hole_offset])
            for (y = [-plate_width/2 + hole_offset, plate_width/2 - hole_offset])
                translate([x, y, 0])
                    cylinder(h = plate_thickness + 1, d = hole_diameter, center = true);
        
        // Central groove
        translate([0, 0, plate_thickness/2 - groove_depth/2])
            cube([plate_length, groove_width, groove_depth], center = true);
    }
}

// Bolt module
module bolt() {
    union() {
        // Bolt shaft
        cylinder(h = bolt_length, d = bolt_diameter, center = false);
        
        // Bolt head
        translate([0, 0, bolt_length])
            cylinder(h = 2, d = bolt_diameter * 1.5, center = false);
    }
}

// Nut module
module nut() {
    difference() {
        // Hexagonal prism
        translate([0, 0, nut_thickness/2])
            rotate([0, 0, 30])
                linear_extrude(height = nut_thickness)
                    polygon(points = [[-nut_size/2, 0], [-nut_size/4, nut_size * sqrt(3)/4], [nut_size/4, nut_size * sqrt(3)/4], [nut_size/2, 0], [nut_size/4, -nut_size * sqrt(3)/4], [-nut_size/4, -nut_size * sqrt(3)/4]]);
        
        // Threaded hole
        translate([0, 0, nut_thickness/2])
            cylinder(h = nut_thickness + 1, d = bolt_diameter, center = true);
    }
}

// Assembly
module assembly() {
    // Layer 1: Top base plate
    translate([0, 0, plate_thickness/2])
        base_plate();
    
    // Layer 2: Bolts and nuts
    for (x = [-plate_length/2 + hole_offset, plate_length/2 - hole_offset])
        for (y = [-plate_width/2 + hole_offset, plate_width/2 - hole_offset]) {
            // Bolts
            translate([x, y, -bolt_length/2])
                bolt();
            
            // Nuts
            translate([x, y, -bolt_length - nut_thickness/2])
                nut();
        }
    
    // Layer 3: Bottom base plate
    translate([0, 0, -plate_thickness/2 - bolt_length - nut_thickness])
        base_plate();
}

// Render the assembly
assembly();

