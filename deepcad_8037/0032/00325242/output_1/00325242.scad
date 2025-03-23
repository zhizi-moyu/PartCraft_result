
// Main block
module main_block() {
    difference() {
        // Base cuboid
        cube([40, 40, 60], center = true);
        
        // Front face cutouts
        translate([-15, -20, 15]) cube([10, 25, 5], center = false); // Adjusted top slot
        translate([-15, -20, -5]) cube([10, 25, 5], center = false); // Adjusted bottom slot
        translate([-15, -20, -25]) cube([25, 30, 10], center = false); // Adjusted center cutout
        
        // Top opening
        translate([-20, -20, 30]) cube([40, 50, 10], center = false); // Widened top opening
    }
}

// Angled support beam
module angled_support_beam() {
    rotate([0, 0, 30]) translate([0, 0, -10]) cube([5, 5, 70], center = true); // Adjusted angle and length
}

// Protruding rectangular arm
module protruding_rectangular_arm() {
    translate([20, 0, -10]) cube([40, 10, 5], center = true); // Extended length and lowered position
}

// Assemble the model
module flexible_coupling() {
    main_block();
    translate([0, 0, 0]) angled_support_beam();
    translate([0, 0, 0]) protruding_rectangular_arm();
}

// Render the model
flexible_coupling();

