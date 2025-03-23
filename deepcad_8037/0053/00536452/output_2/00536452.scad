
// Spacer Ring Parameters
spacer_ring_outer_diameter = 50; // Outer diameter of the ring
spacer_ring_inner_diameter = 40; // Inner diameter of the ring
spacer_ring_thickness = 0.5; // Reduced thickness to match the original model's flat and thin profile

// Spacer Ring Component
module spacer_ring() {
    difference() {
        // Outer cylinder
        cylinder(d=spacer_ring_outer_diameter, h=spacer_ring_thickness, $fn=100);
        // Inner cylinder (hole)
        translate([0, 0, -1]) // Ensure the hole is centered
        cylinder(d=spacer_ring_inner_diameter, h=spacer_ring_thickness + 2, $fn=100);
    }
}

// Flange Plate Parameters
flange_plate_width = 60; // Adjusted width to match the proportions of the original flange plate
flange_plate_height = 40; // Height of the flange plate
flange_plate_thickness = 2; // Thickness of the flange plate

// Flange Plate Component
module flange_plate() {
    cube([flange_plate_width, flange_plate_height, flange_plate_thickness], center=true);
}

// Render Spacer Ring
spacer_ring();

// Render Flange Plate
translate([0, 0, spacer_ring_thickness + flange_plate_thickness / 2])
flange_plate();

