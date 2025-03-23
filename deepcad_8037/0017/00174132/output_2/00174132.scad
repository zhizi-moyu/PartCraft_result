
// Parameters for the model
main_body_outer_diameter = 36; // Reduced to make the wall thinner
main_body_inner_diameter = 30;
main_body_height = 20;
mounting_loop_radius = 4; // Matches original model
mounting_loop_thickness = 1.5; // Matches original model
mounting_loop_offset = main_body_outer_diameter / 2 + mounting_loop_radius - 0.5; // Adjusted position closer to original
end_cap_thickness = 1.2; // Reduced thickness to match original model
inner_ring_outer_diameter = main_body_inner_diameter - 0.5; // Adjusted for snug fit
inner_ring_inner_diameter = 25;
inner_ring_height = 12; // Increased height to match original model

// Function to create a mounting loop
module mounting_loop() {
    translate([0, mounting_loop_offset, 0])
        rotate([90, 0, 0])
            difference() {
                cylinder(r=mounting_loop_radius, h=mounting_loop_thickness, center=true);
                cylinder(r=mounting_loop_radius - 1, h=mounting_loop_thickness + 1, center=true);
            }
}

// Main body
module main_body() {
    difference() {
        cylinder(r=main_body_outer_diameter / 2, h=main_body_height, center=false);
        translate([0, 0, -1])
            cylinder(r=main_body_inner_diameter / 2, h=main_body_height + 2, center=false);
    }
    // Add mounting loops
    for (i = [0, 120, 240]) {
        rotate([0, 0, i])
            mounting_loop();
    }
}

// End cap
module end_cap() {
    difference() {
        cylinder(r=main_body_outer_diameter / 2, h=end_cap_thickness, center=false);
        translate([0, 0, -1])
            cylinder(r=main_body_inner_diameter / 2, h=end_cap_thickness + 2, center=false);
    }
    // Add mounting loops
    for (i = [0, 120, 240]) {
        rotate([0, 0, i])
            mounting_loop();
    }
}

// Inner cylindrical ring
module inner_cylindrical_ring() {
    difference() {
        cylinder(r=inner_ring_outer_diameter / 2, h=inner_ring_height, center=false);
        translate([0, 0, -1])
            cylinder(r=inner_ring_inner_diameter / 2, h=inner_ring_height + 2, center=false);
    }
}

// Assembly
module assembly() {
    // Layer 3: Main body
    main_body();

    // Layer 2: Inner cylindrical ring
    translate([0, 0, 5])
        inner_cylindrical_ring();

    // Layer 1: End cap
    translate([0, 0, main_body_height])
        end_cap();
}

// Render the assembly
assembly();

