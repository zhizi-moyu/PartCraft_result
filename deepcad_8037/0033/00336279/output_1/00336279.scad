
// Clip dimensions
clip_width = 12;
clip_height = 22;
clip_thickness = 6;
cutout_width = 4;
cutout_height = 6;
top_curve_radius = 4;

// Module to create the clip
module clip() {
    difference() {
        // Main body of the clip
        hull() {
            translate([0, 0, clip_thickness / 2])
                cube([clip_width, clip_height, clip_thickness], center=true);
            translate([0, clip_height / 2 - top_curve_radius, clip_thickness / 2])
                cylinder(r=top_curve_radius, h=clip_thickness, center=true);
        }
        
        // U-shaped cutout at the bottom with straight legs
        translate([-cutout_width / 2, -clip_height / 2, -clip_thickness])
            cube([cutout_width, cutout_height, clip_thickness * 2], center=false);
    }
}

// Render the clip
clip();

