
// Parameters
plate_thickness = 2; // Thickness of triangular plates
spacer_thickness = 1; // Thickness of spacers
bolt_diameter = 2; // Diameter of bolts
nut_size = 4; // Size of nuts
plate_side_length = 50; // Side length of triangular plates
hole_diameter = 10; // Diameter of central hole in plates
vertex_hole_diameter = 4; // Diameter of vertex holes in plates
spacer_outer_diameter = hole_diameter; // Outer diameter of spacers
spacer_inner_diameter = bolt_diameter; // Inner diameter of spacers
bolt_length = 20; // Length of bolts

// Helper function to create a triangular plate
module triangular_plate() {
    difference() {
        // Create the triangular plate
        polygon(points=[[0,0], [plate_side_length,0], [plate_side_length/2,plate_side_length*sqrt(3)/2]]);
        linear_extrude(height=plate_thickness) {
            // Create the central hole
            translate([plate_side_length/2, plate_side_length*sqrt(3)/4]) {
                circle(d=hole_diameter);
            }
            // Create the vertex holes
            translate([0,0]) {
                circle(d=vertex_hole_diameter);
            }
            translate([plate_side_length,0]) {
                circle(d=vertex_hole_diameter);
            }
            translate([plate_side_length/2, plate_side_length*sqrt(3)/2]) {
                circle(d=vertex_hole_diameter);
            }
        }
    }
}

// Helper function to create a spacer
module spacer() {
    difference() {
        // Create the outer ring
        cylinder(d=spacer_outer_diameter, h=spacer_thickness);
        // Create the inner hole
        cylinder(d=spacer_inner_diameter, h=spacer_thickness);
    }
}

// Helper function to create a bolt
module bolt() {
    cylinder(d=bolt_diameter, h=bolt_length);
}

// Helper function to create a nut
module nut() {
    difference() {
        // Create the hexagonal prism
        rotate([0,0,30]) {
            linear_extrude(height=plate_thickness) {
                polygon(points=[[0,0], [nut_size,0], [nut_size*cos(60),nut_size*sin(60)], [0,nut_size*sin(60)], [-nut_size*cos(60),nut_size*sin(60)], [-nut_size,0]]);
            }
        }
        // Create the internal threading hole
        cylinder(d=bolt_diameter, h=plate_thickness);
    }
}

// Assembly
module assembly() {
    // Layer 1: Top triangular plate
    translate([0,0,0]) {
        triangular_plate();
    }
    // Layer 2: Spacer
    translate([0,0,plate_thickness]) {
        spacer();
    }
    // Layer 3: Second triangular plate
    translate([0,0,plate_thickness+spacer_thickness]) {
        triangular_plate();
    }
    // Layer 4: Spacer
    translate([0,0,2*plate_thickness+spacer_thickness]) {
        spacer();
    }
    // Layer 5: Third triangular plate
    translate([0,0,2*plate_thickness+2*spacer_thickness]) {
        triangular_plate();
    }
    // Layer 6: Spacer
    translate([0,0,3*plate_thickness+2*spacer_thickness]) {
        spacer();
    }
    // Layer 7: Bottom triangular plate
    translate([0,0,3*plate_thickness+3*spacer_thickness]) {
        triangular_plate();
    }
    // Fastening: Bolts and nuts
    for (i = [0:2]) {
        translate([plate_side_length/2*cos(i*120), plate_side_length/2*sin(i*120), 0]) {
            bolt();
            translate([0,0,bolt_length]) {
                nut();
            }
        }
    }
}

// Render the assembly
assembly();

