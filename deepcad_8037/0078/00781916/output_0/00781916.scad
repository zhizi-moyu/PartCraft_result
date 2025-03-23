
// Parameters
base_disk_radius = 20; // Radius of the base disk
base_disk_thickness = 5; // Thickness of the base disk
prong_width = 4; // Width of each vertical prong
prong_depth = 10; // Depth of each vertical prong
prong_height = 20; // Height of each vertical prong
num_prongs = 4; // Number of prongs
prong_spacing_angle = 360 / num_prongs; // Angle between prongs

// Base disk module
module base_disk() {
    cylinder(h = base_disk_thickness, r = base_disk_radius, center = false);
}

// Vertical prong module
module vertical_prong() {
    cube([prong_width, prong_depth, prong_height], center = true);
}

// Assembly
module flexible_coupling() {
    // Layer 2: Base disk
    base_disk();

    // Layer 1: Vertical prongs
    for (i = [0 : num_prongs - 1]) {
        rotate([0, 0, i * prong_spacing_angle]) {
            translate([base_disk_radius - prong_depth / 2, 0, base_disk_thickness]) {
                vertical_prong();
            }
        }
    }
}

// Render the flexible coupling
flexible_coupling();

