
// Main block
module main_block() {
    difference() {
        // Base cuboid
        cube([40, 40, 60], center = true);
        
        // Front face cutouts
        translate([-15, -20, 20]) cube([12, 30, 5], center = false); // Resized and repositioned top slot
        translate([-15, -20, -10]) cube([12, 30, 5], center = false); // Resized and repositioned bottom slot
        translate([-15, -20, -30]) cube([30, 35, 12], center = false); // Resized and repositioned center cutout
        
        // Top opening
        translate([-20, -20, 30]) cube([50, 60, 10], center = false); // Widened top opening
    }
}

// Angled support beam
module angled_support_beam() {
    rotate([0, 0, 20]) translate([0, 0, -15]) cube([7, 7, 75], center = true); // Adjusted angle, thickness, and length
}

// Protruding rectangular arm
module protruding_rectangular_arm() {
    translate([20, 0, 5]) cube([50, 10, 5], center = true); // Lengthened and repositioned higher
}

// Assemble the model
module flexible_coupling() {
    main_block();
    translate([0, 0, 0]) angled_support_beam();
    translate([0, 0, 0]) protruding_rectangular_arm();
}

// Render the model
flexible_coupling();

