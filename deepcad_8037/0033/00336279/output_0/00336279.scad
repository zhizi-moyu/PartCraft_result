
// Clip dimensions
clip_width = 10;
clip_height = 20;
clip_thickness = 3;
cutout_width = 4;
cutout_height = 5;
top_curve_radius = 12;

// Module to create the clip
module clip() {
    difference() {
        // Main body of the clip
        hull() {
            translate([0, 0, clip_thickness / 2])
                cube([clip_width, clip_height, clip_thickness], center=true);
            translate([0, clip_height / 2, clip_thickness / 2])
                cylinder(r=top_curve_radius, h=clip_thickness, center=true);
        }
        
        // U-shaped cutout at the bottom
        translate([-cutout_width / 2, -clip_height / 2, -clip_thickness])
            cube([cutout_width, cutout_height, clip_thickness * 2], center=false);
    }
}

// Render the clip
clip();

