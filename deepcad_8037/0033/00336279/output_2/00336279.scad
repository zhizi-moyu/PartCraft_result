
// Clip dimensions
clip_width = 12;
clip_height = 22;
clip_thickness = 6;
cutout_width = 4;
cutout_height = 6;
top_curve_radius = 2; // Reduced to make the top slightly curved but not overly rounded

// Module to create the clip
module clip() {
    difference() {
        // Main body of the clip (rectangular with a slightly curved top)
        union() {
            cube([clip_width, clip_height - top_curve_radius, clip_thickness], center=true);
            translate([clip_width / 2, (clip_height - top_curve_radius) / 2, 0])
                cylinder(r=top_curve_radius, h=clip_thickness, center=true);
        }
        
        // More defined and narrower U-shaped cutout at the bottom
        translate([-cutout_width / 2, -clip_height / 2, -clip_thickness])
            cube([cutout_width, cutout_height, clip_thickness * 2], center=false);
    }
}

// Render the clip
clip();

