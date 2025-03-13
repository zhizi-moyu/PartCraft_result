
// Parameters
central_body_diameter = 30; // Diameter of the central body
central_body_length = 40;   // Adjusted length of the central body to match the original model
groove_width = 2;           // Width of the grooves
groove_depth = 5;           // Depth of the grooves
hole_diameter = 5;          // Diameter of the bolt holes
bolt_diameter = 4;          // Diameter of the bolts
bolt_length = 50;           // Adjusted length of the bolts to match the original model
nut_diameter = 8;           // Diameter of the nuts
nut_thickness = 4;          // Thickness of the nuts

// Central Body
module central_body() {
    difference() {
        // Main cylinder
        cylinder(h = central_body_length, d = central_body_diameter, $fn = 100);
        
        // Bolt holes
        for (i = [0, 180]) {
            rotate([0, 0, i])
                translate([central_body_diameter / 4, 0, central_body_length / 2])
                    cylinder(h = central_body_length + 2, d = hole_diameter, $fn = 100);
        }
        
        // Grooves
        for (z = [12, 28]) { // Adjusted groove positions to match the original model
            translate([0, 0, z])
                rotate([90, 0, 0])
                    cube([central_body_diameter + 2, groove_width, groove_depth], center = true);
        }
    }
}

// Bolt
module bolt() {
    cylinder(h = bolt_length, d = bolt_diameter, $fn = 100);
}

// Nut
module nut() {
    difference() {
        // Hexagonal nut
        rotate([0, 0, 30])
            linear_extrude(height = nut_thickness)
                polygon(points = [
                    [nut_diameter / 2, 0],
                    [nut_diameter / 4, nut_diameter * sqrt(3) / 4],
                    [-nut_diameter / 4, nut_diameter * sqrt(3) / 4],
                    [-nut_diameter / 2, 0],
                    [-nut_diameter / 4, -nut_diameter * sqrt(3) / 4],
                    [nut_diameter / 4, -nut_diameter * sqrt(3) / 4]
                ]);
        
        // Internal threading
        translate([0, 0, -1])
            cylinder(h = nut_thickness + 2, d = bolt_diameter, $fn = 100);
    }
}

// Assembly
module assembly() {
    // Central body
    central_body();
    
    // Bolts and nuts
    for (i = [0, 180]) {
        rotate([0, 0, i]) {
            // Bolt
            translate([central_body_diameter / 4, 0, -5])
                bolt();
            
            // Nut on one side
            translate([central_body_diameter / 4, 0, -nut_thickness - 2]) // Adjusted nut position closer to the central body
                nut();
            
            // Nut on the other side
            translate([central_body_diameter / 4, 0, central_body_length + 2]) // Adjusted nut position closer to the central body
                nut();
        }
    }
}

// Render the assembly
assembly();

