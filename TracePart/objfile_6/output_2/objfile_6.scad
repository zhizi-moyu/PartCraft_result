
// Parameters
hub_diameter = 30; // Diameter of hubs
hub_length = 45; // Length of central hub (elongated)
input_output_hub_length = 35; // Length of input/output hubs (elongated)
bore_diameter = 10; // Diameter of bore
keyway_width = 6; // Width of keyway (widened)
keyway_depth = 3; // Depth of keyway (deepened)
slit_width = 4; // Width of slit (widened)
flange_diameter = 50; // Diameter of flange plates
flange_thickness = 5; // Thickness of flange plates
spacer_ring_thickness = 2; // Thickness of spacer rings
spacer_ring_outer_diameter = 55; // Outer diameter of spacer rings (increased)
bolt_diameter = 5; // Diameter of bolts (adjusted)
bolt_length = 70; // Length of bolts (elongated)
nut_diameter = 6; // Diameter of nuts
nut_thickness = 3; // Thickness of nuts
bolt_hole_radius = 20; // Radius of bolt holes from center
bolt_hole_count = 6; // Number of bolt holes (increased)

// Helper function to create a hub
module hub(length, bore_diameter, keyway_width, keyway_depth, slit_width) {
    difference() {
        cylinder(d = hub_diameter, h = length, $fn = 100);
        translate([0, 0, -1]) {
            cylinder(d = bore_diameter, h = length + 2, $fn = 100);
        }
        translate([-keyway_width / 2, 0, -1]) {
            cube([keyway_width, bore_diameter, length + 2]);
        }
        translate([-hub_diameter / 2, -slit_width / 2, -1]) {
            cube([hub_diameter, slit_width, length + 2]);
        }
    }
}

// Helper function to create a flange plate
module flange_plate() {
    difference() {
        cylinder(d = flange_diameter, h = flange_thickness, $fn = 100);
        translate([0, 0, -1]) {
            cylinder(d = hub_diameter, h = flange_thickness + 2, $fn = 100);
        }
        for (i = [0:bolt_hole_count - 1]) {
            rotate([0, 0, i * 360 / bolt_hole_count]) {
                translate([bolt_hole_radius, 0, -1]) {
                    cylinder(d = bolt_diameter, h = flange_thickness + 2, $fn = 100);
                }
            }
        }
    }
}

// Helper function to create a spacer ring
module spacer_ring() {
    difference() {
        cylinder(d = spacer_ring_outer_diameter, h = spacer_ring_thickness, $fn = 100);
        translate([0, 0, -1]) {
            cylinder(d = hub_diameter, h = spacer_ring_thickness + 2, $fn = 100);
        }
    }
}

// Helper function to create a bolt
module bolt() {
    cylinder(d = bolt_diameter, h = bolt_length, $fn = 100);
}

// Helper function to create a nut
module nut() {
    cylinder(d = nut_diameter, h = nut_thickness, $fn = 6);
}

// Assembly
translate([0, 0, hub_length / 2]) {
    hub(hub_length, bore_diameter, keyway_width, keyway_depth, slit_width); // Central hub
}

translate([0, 0, hub_length + input_output_hub_length / 2]) {
    hub(input_output_hub_length, bore_diameter, keyway_width, keyway_depth, slit_width); // Input hub
}

translate([0, 0, -hub_length - input_output_hub_length / 2]) {
    hub(input_output_hub_length, bore_diameter, keyway_width, keyway_depth, slit_width); // Output hub
}

translate([0, 0, hub_length]) {
    flange_plate(); // Flange plate 1
}

translate([0, 0, hub_length + flange_thickness]) {
    spacer_ring(); // Spacer ring 1
}

translate([0, 0, hub_length + flange_thickness + spacer_ring_thickness]) {
    flange_plate(); // Flange plate 2
}

translate([0, 0, hub_length + flange_thickness * 2 + spacer_ring_thickness]) {
    spacer_ring(); // Spacer ring 2
}

translate([0, 0, hub_length + flange_thickness * 2 + spacer_ring_thickness * 2]) {
    flange_plate(); // Flange plate 3
}

translate([0, 0, hub_length + flange_thickness * 3 + spacer_ring_thickness * 2]) {
    spacer_ring(); // Spacer ring 3
}

translate([0, 0, hub_length + flange_thickness * 3 + spacer_ring_thickness * 3]) {
    flange_plate(); // Flange plate 4
}

// Bolts and nuts
for (i = [0:bolt_hole_count - 1]) {
    rotate([0, 0, i * 360 / bolt_hole_count]) {
        translate([bolt_hole_radius, 0, hub_length]) {
            bolt();
            translate([0, 0, bolt_length]) {
                nut();
            }
        }
    }
}

