
// Parameters
hub_diameter = 20; // Diameter of the input and output hubs
hub_length = 15; // Length of the hubs
bore_diameter = 8; // Diameter of the central bore
slit_width = 1; // Width of the slit
threaded_hole_diameter = 3; // Diameter of the threaded hole
spacer_ring_diameter = 20; // Diameter of the flexible spacer rings
spacer_ring_thickness = 2; // Thickness of the spacer rings
spacer_ring_wave_amplitude = 1; // Amplitude of the wavy profile
spacer_ring_wave_frequency = 3; // Number of waves around the ring
screw_diameter = 3; // Diameter of the clamping screws
screw_length = 30; // Length of the clamping screws
nut_diameter = 5; // Diameter of the clamping nuts
nut_thickness = 3; // Thickness of the clamping nuts

// Modules
module hub() {
    difference() {
        cylinder(d = hub_diameter, h = hub_length, center = true);
        translate([0, 0, -hub_length / 2])
            cylinder(d = bore_diameter, h = hub_length + 2, center = true);
        translate([hub_diameter / 2 - slit_width / 2, 0, -hub_length / 2])
            cube([slit_width, hub_diameter, hub_length + 2], center = true);
        translate([hub_diameter / 2 - 2, 0, 0])
            rotate([90, 0, 0])
                cylinder(d = threaded_hole_diameter, h = hub_diameter, center = true);
    }
}

module flexible_spacer_ring() {
    difference() {
        cylinder(d = spacer_ring_diameter, h = spacer_ring_thickness, center = true);
        translate([0, 0, -spacer_ring_thickness / 2])
            cylinder(d = spacer_ring_diameter - 2, h = spacer_ring_thickness + 2, center = true);
        for (i = [0:360 / spacer_ring_wave_frequency:360]) {
            rotate([0, 0, i])
                translate([spacer_ring_diameter / 2 - spacer_ring_wave_amplitude, 0, 0])
                    sphere(r = spacer_ring_wave_amplitude);
        }
    }
}

module clamping_screw() {
    cylinder(d = screw_diameter, h = screw_length, center = true);
}

module clamping_nut() {
    cylinder(d = nut_diameter, h = nut_thickness, center = true);
}

// Assembly
module flexible_coupling() {
    translate([0, 0, hub_length / 2])
        hub(); // Input hub
    translate([0, 0, hub_length / 2 + spacer_ring_thickness])
        flexible_spacer_ring(); // First spacer ring
    translate([0, 0, hub_length / 2 + 2 * spacer_ring_thickness])
        flexible_spacer_ring(); // Second spacer ring
    translate([0, 0, hub_length / 2 + 3 * spacer_ring_thickness])
        flexible_spacer_ring(); // Third spacer ring
    translate([0, 0, hub_length / 2 + 4 * spacer_ring_thickness])
        hub(); // Output hub

    // Clamping screws and nuts
    for (i = [0:120:360]) {
        rotate([0, 0, i]) {
            translate([hub_diameter / 2 - screw_diameter / 2, 0, hub_length / 2])
                clamping_screw();
            translate([hub_diameter / 2 - screw_diameter / 2, 0, hub_length / 2 + screw_length])
                clamping_nut();
        }
    }
}

// Render the flexible coupling
flexible_coupling();

