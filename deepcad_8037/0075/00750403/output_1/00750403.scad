
// Parameters for the rectangular block
block_length = 60;  // Length of the block
block_width = 30;   // Width of the block
block_height = 40;  // Height of the block
frame_thickness = 5; // Thickness of the outer frame
cutout_width = 20;  // Width of the rectangular cutouts
cutout_height = 10; // Height of the rectangular cutouts
cutout_spacing = 10; // Spacing between the two cutouts
taper_angle = 15;   // Angle for the inward slope of the cutouts

module tapered_cutout(length, width, height, angle) {
    difference() {
        cube([length, width, height], center = true);
        translate([0, 0, height / 2])
            rotate([angle, 0, 0])
            cube([length, width, height * 2], center = true);
        translate([0, 0, -height / 2])
            rotate([-angle, 0, 0])
            cube([length, width, height * 2], center = true);
    }
}

module rectangular_block_with_cutouts() {
    // Outer block with softened edges
    difference() {
        minkowski() {
            cube([block_length, block_width, block_height], center = true);
            sphere(frame_thickness / 2);
        }
        
        // Create the two tapered rectangular cutouts
        translate([0, 0, block_height / 4])
            tapered_cutout(block_length, cutout_width, cutout_height, taper_angle);
        translate([0, 0, -block_height / 4])
            tapered_cutout(block_length, cutout_width, cutout_height, taper_angle);
    }
}

// Render the model
rectangular_block_with_cutouts();

