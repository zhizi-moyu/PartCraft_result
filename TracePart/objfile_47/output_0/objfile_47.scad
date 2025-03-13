
// Parameters
hub_diameter = 30; // Diameter of the input and output hubs
hub_height = 15; // Height of the input and output hubs
bore_diameter = 10; // Diameter of the central bore
clamping_slot_width = 3; // Width of the clamping slots
clamping_slot_depth = 10; // Depth of the clamping slots
screw_diameter = 3; // Diameter of the clamping screws
screw_head_diameter = 5; // Diameter of the screw head
screw_head_height = 2; // Height of the screw head
flexible_element_thickness = 2; // Thickness of the flexible element
flexible_element_waviness = 2; // Amplitude of the wavy structure
flexible_element_segments = 36; // Number of segments for the wavy structure

// Input Hub
module input_hub() {
    difference() {
        cylinder(d = hub_diameter, h = hub_height, center = true);
        translate([0, 0, -hub_height / 2])
            cylinder(d = bore_diameter, h = hub_height * 2, center = true);
        for (i = [0, 90, 180, 270]) {
            rotate([0, 0, i])
                translate([hub_diameter / 2 - clamping_slot_depth / 2, 0, -hub_height / 2])
                    cube([clamping_slot_depth, clamping_slot_width, hub_height * 2], center = true);
        }
        for (i = [0, 90, 180, 270]) {
            rotate([0, 0, i])
                translate([hub_diameter / 2 - screw_head_diameter / 2, 0, hub_height / 4])
                    cylinder(d = screw_head_diameter, h = screw_head_height, center = true);
        }
    }
}

// Output Hub
module output_hub() {
    input_hub();
}

// Flexible Element
module flexible_element() {
    difference() {
        cylinder(d = hub_diameter, h = flexible_element_thickness, center = true);
        translate([0, 0, -flexible_element_thickness / 2])
            cylinder(d = hub_diameter - flexible_element_waviness, h = flexible_element_thickness * 2, center = true);
    }
}

// Clamping Screw
module clamping_screw() {
    union() {
        cylinder(d = screw_diameter, h = hub_height, center = true);
        translate([0, 0, hub_height / 2])
            cylinder(d = screw_head_diameter, h = screw_head_height, center = true);
    }
}

// Assembly
module flexible_coupling() {
    // Layer 1: Input Hub and Clamping Screws
    translate([0, 0, hub_height / 2])
        input_hub();
    for (i = [0, 90, 180, 270]) {
        rotate([0, 0, i])
            translate([hub_diameter / 2 - screw_head_diameter / 2, 0, hub_height])
                clamping_screw();
    }

    // Layer 2: Flexible Element
    translate([0, 0, 0])
        flexible_element();

    // Layer 3: Output Hub and Clamping Screws
    translate([0, 0, -hub_height / 2])
        output_hub();
    for (i = [0, 90, 180, 270]) {
        rotate([0, 0, i])
            translate([hub_diameter / 2 - screw_head_diameter / 2, 0, -hub_height])
                clamping_screw();
    }
}

// Render the model
flexible_coupling();

