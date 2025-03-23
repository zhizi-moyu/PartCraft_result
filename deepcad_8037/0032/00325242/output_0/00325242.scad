
// Main block
module main_block() {
    difference() {
        // Base cuboid
        cube([40, 40, 60], center = true);
        
        // Front face cutouts
        translate([-15, -20, 10]) cube([10, 30, 5], center = false); // Top slot
        translate([-15, -20, -10]) cube([10, 30, 5], center = false); // Bottom slot
        translate([-15, -20, -30]) cube([20, 30, 10], center = false); // Center cutout
        
        // Top opening
        translate([-20, -20, 30]) cube([40, 40, 10], center = false);
    }
}

// Angled support beam
module angled_support_beam() {
    rotate([0, 0, 45]) translate([0, 0, -10]) cube([5, 5, 50], center = true);
}

// Protruding rectangular arm
module protruding_rectangular_arm() {
    translate([20, 0, 0]) cube([30, 10, 5], center = true);
}

// Assemble the model
module flexible_coupling() {
    main_block();
    translate([0, 0, 0]) angled_support_beam();
    translate([0, 0, 0]) protruding_rectangular_arm();
}

// Render the model
flexible_coupling();

