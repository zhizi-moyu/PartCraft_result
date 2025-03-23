
// Parameters
bracket_thickness = 4; // Reduced thickness for smoother edges
bracket_hole_diameter = 3;
bracket_long_arm_length = 40;
bracket_short_arm_length = 20;
bracket_width = 10;

spacer_length = 20;
spacer_width = 10;
spacer_thickness = 4; // Reduced thickness to match original design
spacer_slot_width = 5; // Increased slot width to match original design

fastener_diameter = 3;
fastener_length = 12; // Shortened fastener length to match original design

// Bracket module
module bracket() {
    difference() {
        union() {
            // Long arm with rounded edges
            hull() {
                translate([bracket_long_arm_length / 2, 0, 0])
                    cube([bracket_long_arm_length, bracket_width, bracket_thickness], center = true);
                translate([-bracket_long_arm_length / 2, 0, 0])
                    cube([bracket_long_arm_length, bracket_width, bracket_thickness], center = true);
            }
            // Short arm with rounded edges
            translate([-(bracket_long_arm_length / 2 - bracket_short_arm_length / 2), 0, 0])
                hull() {
                    cube([bracket_short_arm_length, bracket_width, bracket_thickness], center = true);
                    translate([bracket_short_arm_length, 0, 0])
                        cube([bracket_short_arm_length, bracket_width, bracket_thickness], center = true);
                }
        }
        // Holes
        translate([bracket_long_arm_length / 4, 0, 0])
            cylinder(h = bracket_thickness + 1, d = bracket_hole_diameter, center = true);
        translate([-bracket_long_arm_length / 4, 0, 0])
            cylinder(h = bracket_thickness + 1, d = bracket_hole_diameter, center = true);
        translate([-(bracket_long_arm_length / 2 - bracket_short_arm_length / 2), 0, 0])
            cylinder(h = bracket_thickness + 1, d = bracket_hole_diameter, center = true);
    }
}

// Spacer module
module spacer() {
    difference() {
        cube([spacer_length, spacer_width, spacer_thickness], center = true);
        translate([0, 0, 0])
            cube([spacer_length, spacer_slot_width, spacer_thickness + 1], center = true);
    }
}

// Fastener module
module fastener() {
    cylinder(h = fastener_length, d = fastener_diameter, center = true);
}

// Assembly
module assembly() {
    // Layer 1: Brackets
    for (i = [0:5]) {
        rotate([0, 0, i * 60])
            translate([30, 0, bracket_thickness / 2])
                bracket();
    }

    // Layer 2: Spacer
    spacer();

    // Layer 3: Fasteners
    for (i = [0:5]) {
        rotate([0, 0, i * 60])
            translate([30, 0, -fastener_length / 2])
                fastener();
        rotate([0, 0, i * 60])
            translate([-30, 0, -fastener_length / 2])
                fastener();
    }
}

// Render the assembly
assembly();

